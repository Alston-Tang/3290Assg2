function gImg = CPD( rgbImg )

sigmaV = 6;

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

omega = [1/3, 1/3, 1/3, 0, 0, 0, 0, 0, 0];

for i = 1:15
    dgB = zeros(size(l));
    dgR = zeros(size(l));
    for j = 1:9
        dgB = dgB + omega(j) * LB(:, :, j);
        dgR = dgR + omega(j) * LR(:, :, j);
    end
    GPB = normpdf(dgB, deltaB, sigmaV);
    GPB(GPB < eps) = eps;
    MGPB = normpdf(dgB, -deltaB, sigmaV);
    MGPB(MGPB < eps) = eps;
    BB = (AB .* GPB) ./ (AB .* GPB + (-AB + 1) .* MGPB);
    GPR = normpdf(dgR, deltaR, sigmaV);
    GPR(GPR < eps) = eps;
    MGPR = normpdf(dgR, -deltaR, sigmaV);
    MGPR(MGPR < eps) = eps;
    BR = (AR .* GPR) ./ (AR .* GPR + (-AR + 1) .* MGPR);
    
    rhs = zeros(9,1);
    lhs = zeros(9,9);
    for j = 1:9
        rhs(j) = sum(sum((2 * BB - 1) .* LB(:,:,j) .* deltaB)) + sum(sum((2 * BR - 1) .* LR(:,:,j) .* deltaR));
        for k = 1:9
            lhs(j,k) = sum(sum(LB(:,:,j) .* LB(:,:,k) + LR(:,:,j) .* LR(:,:,k)));
        end
    end
    
    omega = lhs \ rhs;
end

gImg = zeros(size(l));

R = rgbImg(:,:,1);
G = rgbImg(:,:,2);
B = rgbImg(:,:,3);


gImg = gImg + R * omega(1);
gImg = gImg + G * omega(2);
gImg = gImg + B * omega(3);
gImg = gImg + R .* G * omega(4);
gImg = gImg + R .* B * omega(5);
gImg = gImg + G .* B * omega(6);
gImg = gImg + R .* R * omega(7);
gImg = gImg + G .* G * omega(8);
gImg = gImg + B .* B * omega(9);

gImg = (gImg - min(gImg(:)))/ (max(gImg(:)) - min(gImg(:)));

end

