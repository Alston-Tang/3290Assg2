function gIm = cprgb2gray(im)
    imgSize = size(im);
    pixelSize = imgSize(1) * imgSize(2);
	% input 'im' is a color image
	% output gIm is the resulting grayscale image

	% TODO: Convert the input to LAB space
    labImg = rgb2lab(im);

	% TODO: Construct delta_xy for each neighboring pixels
    
    imgL = labImg(:,:,1);
    imgA = labImg(:,:,2);
    imgB = labImg(:,:,3);
    
    deltaR = calcDelta(imgL, imgA, imgB, 0, -1);    
    deltaB = calcDelta(imgL, imgA, imgB, -1, 0);

	% TODO: Constructing A and Delta
    indexX = zeros(4 * pixelSize, 1);
    indexY = zeros(4 * pixelSize, 1);
    value = zeros(4 * pixelSize, 1);
    
    delta = zeros(pixelSize * 2, 1);
    count = 1;
    for i = 1 : imgSize(1)
        for j = 1 : imgSize(2)
            index = (i - 1) * imgSize(2) + j;
            
            indexY(count) = index;
            indexX(count) = index;
            value(count) = 1;
            count = count + 1;
            
            indexY(count) = index;
            value(count) = -1;
            if j >= imgSize(2)
                indexX(count) = index + 1 - imgSize(2);
            else
                indexX(count) = index + 1;
            end
            count = count + 1;
            delta(index) = deltaR(i, j);
            
            indexLowwer = index + pixelSize;
            indexY(count) = indexLowwer;
            indexX(count) = index;
            value(count) = 1;
            count = count + 1;
            
            indexY(count) = indexLowwer;
            value(count) = -1;
            if i >= imgSize(1)
                indexX(count) = index + imgSize(2) - pixelSize;
            else
                indexX(count) = index + imgSize(2);
            end
            count = count + 1;
            delta(index) = deltaB(i, j);
        end
    end
    

	% TODO: Solve the objective function to get G
    
    A = sparse(indexY, indexX, value);
    delta = sparse(delta);
    G = delta\A;
    gIm = reshape(G, [imgSize(1), imgSize(2)]);
    

	% Normalization and output gIm
	gIm = (gIm - min(gIm(:)))/ (max(gIm(:)) - min(gIm(:)));

end

