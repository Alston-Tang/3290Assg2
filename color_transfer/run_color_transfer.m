
% read source image
img_src = im2double(imread('./imgs/ocean_day.jpg'));

% read target image
img_tar = im2double(imread('./imgs/ocean_sunset.jpg'));

% convert source & target image from RGB to Lab
img_lab_s = color_rgb2lab( img_src );
img_lab_t = color_rgb2lab( img_tar );

% do color transfer in Lab colorspace
img_lab_res = color_transfer( img_lab_s, img_lab_t );

% convert result back to RGB color space
img_res = color_lab2rgb( img_lab_res );


figure, imshow( img_res );


