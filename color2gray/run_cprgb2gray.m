
% input color image
Im = im2double(imread('./imgs/2.png'));

% Part 1: Basic Decolorization Algorithm
gIm = cprgb2gray(Im);

% Part 2: Decolorization Evaluation: Color Contrast Preserving Ratio (CCPR)
ccprRes = 0;
for tau = 1:15
    ccpr = CCPR(gIm, Im, tau);
    ccprRes = ccprRes + ccpr;
end

fprintf('CCPR is %f', ccprRes/24);
figure, imshow(Im), figure, imshow(gIm);