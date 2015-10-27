
% input color image
Im = im2double(imread('./imgs/tt.jpg'));

% Part 1: Basic Decolorization Algorithm
gIm = full(cprgb2gray(Im));

% Part 2: Decolorization Evaluation: Color Contrast Preserving Ratio (CCPR)
ccprRes = 0;
for tau = 1:15
    ccpr = CCPR(gIm, Im, tau);
    ccprRes = ccprRes + ccpr;
end

fprintf('CCPR is %f', ccprRes/24);
figure, imshow(Im), figure, imshow(gIm);