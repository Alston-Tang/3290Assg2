function gImg = omega2grey(rgbImg, omega)

gImg = zeros(size(rgbImg,1), size(rgbImg,2));

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

end

