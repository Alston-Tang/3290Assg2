
% input color image
for i = 1:20
Im = im2double(imread(strcat('./imgs/', int2str(i), '.png')));

% Part 1: Basic Decolorization Algorithm
% gIm = full(cprgb2gray(Im));
gIm = RCPD(Im);

imwrite(gIm, strcat('res_rcpd_', int2str(i), '.jpg'));

% Part 2: Decolorization Evaluation: Color Contrast Preserving Ratio (CCPR)
ccprRes = 0;
for tau = 1:15
    ccpr = CCPR(gIm, Im, tau);
    ccprRes = ccprRes + ccpr;
end

fprintf(strcat('CCPR of ', int2str(i), 'is %f'), ccprRes/15);
% figure, imshow(Im), figure, imshow(gIm);
end
