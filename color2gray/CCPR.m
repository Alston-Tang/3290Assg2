function ccrpRe = CCPR(imGray, imColor, THR)
    
	% TODO: ccrpRe evaluation code
    labImg = rgb2lab(imColor);
    
    imgL = labImg(:,:,1);
    imgA = labImg(:,:,2);
    imgB = labImg(:,:,3);
    
    deltaR = calcDelta(imgL, imgA, imgB, 0, -1);    
    deltaB = calcDelta(imgL, imgA, imgB, -1, 0);
    
    maxR = max(deltaR(:));
    minR = min(deltaR(:));
    maxB = max(deltaB(:));
    minB = min(deltaB(:));
    maxV = max(maxR, maxB);
    minV = min(minR, minB);
    
    normTHR = THR / (maxV - minV);
    
    visibleR = deltaR > THR;
    visibleB = deltaB > THR;
    
    
    
    grayDeltaR = abs(imGray - circshift(imGray, -1, 2));
    grayDeltaB = abs(imGray - circshift(imGray, -1, 1));
    
    t = grayDeltaR .* visibleR;
    t = t >= normTHR;
    score = sum(sum(t));
    t = grayDeltaB .* visibleB;
    t = t >= normTHR;
    score = score + sum(sum(t));
    omegaSize = sum(sum(visibleR)) + sum(sum(visibleB));
    
    ccrpRe = score / omegaSize;
end