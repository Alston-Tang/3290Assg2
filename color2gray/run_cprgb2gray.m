
% input color image
Im = im2double(imread('./imgs/7.png'));

% Part 1: Basic Decolorization Algorithm
gIm = full(cprgb2gray(Im));
% gIm = CPD(Im);

imwrite(gIm, 'tt.bmp');

% Part 2: Decolorization Evaluation: Color Contrast Preserving Ratio (CCPR)
ccprRes = 0;
for tau = 1:15
    ccpr = CCPR(gIm, Im, tau);
    ccprRes = ccprRes + ccpr;
end

fprintf('CCPR is %f', ccprRes/15);
figure, imshow(Im), figure, imshow(gIm);