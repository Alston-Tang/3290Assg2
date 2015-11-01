function delta = calcL(rgbImg, dy, dx)

r = rgbImg(:, :, 1);
g = rgbImg(:, :, 2);
b = rgbImg(:, :, 3);

delta = zeros(size(rgbImg, 1), size(rgbImg, 2), 9);

if dx ~= 0
    sr = circshift(r, dx, 2);
    sg = circshift(g, dx, 2);
    sb = circshift(b, dx, 2);
end
if dy ~= 0
    sr = circshift(r, dy, 1);
    sg = circshift(g, dy, 1);
    sb = circshift(b, dy, 1);
end

delta(:, :, 1) = r - sr;
delta(:, :, 2) = g - sg;
delta(:, :, 3) = b - sb;
delta(:, :, 4) = (r.*g) - (sr.*sg);
delta(:, :, 5) = (r.*b) - (sr.*sb);
delta(:, :, 6) = (g.*b) - (sg.*sb);
delta(:, :, 7) = (r.*r) - (sr.*sr);
delta(:, :, 8) = (g.*g) - (sg.*sg);
delta(:, :, 9) = (b.*b) - (sb.*sb);

end

