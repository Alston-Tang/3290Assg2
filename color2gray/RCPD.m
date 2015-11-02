function gImg = RCPD(rgbImg)

sigmaV = 4.5;

labImg = rgb2lab(rgbImg);
l = labImg(: , :, 1);
a = labImg(: , :, 2);
b = labImg(: , :, 3);

deltaB = calcDelta(l, a, b, -1, 0);
deltaR = calcDelta(l, a, b, 0, -1);

LB = calcL(rgbImg, -1, 0);
LR = calcL(rgbImg, 0, -1);

AB = calcAlpha(rgbImg, -1, 0);
AR = calcAlpha(rgbImg, 0, -1);

EMin = Inf(1);

for r = 0:0.1:1
    for g = 0:0.1:1-r 
        b = 1 - r - g;
        dgB = r * LB(:, :, 1) + g * LB(:, :, 2) + b * LB(:, :, 3);
        dgR = r * LR(:, :, 1) + g * LR(:, :, 2) + b * LR(:, :, 3);
        tt = AB .* normpdf(dgB, deltaB, sigmaV) + (-AB + 1) .* normpdf(dgB, -deltaB, sigmaV);
        E = -sum(sum(log(tt)));
        tt = AR .* normpdf(dgR, deltaR, sigmaV) + (-AR + 1) .* normpdf(dgR, -deltaR, sigmaV);
        E = E + -sum(sum(log(tt)));
        if E < EMin
            EMin = E;
            rBest = r;
            gBest = g;
            bBest = b;
        end
    end
end

gImg = zeros(size(rgbImg, 1),size(rgbImg, 2));

gImg = gImg + rgbImg(:,:,1) * rBest;
gImg = gImg + rgbImg(:,:,2) * gBest;
gImg = gImg + rgbImg(:,:,3) * bBest;


end

