function deltaAlpha = calcAlpha( rgbImg, dy, dx )

r = rgbImg(:, :, 1);
g = rgbImg(:, :, 2);
b = rgbImg(:, :, 3);

deltaAlpha = zeros(size(rgbImg, 1), size(rgbImg, 2));

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

dr = r - sr;
dg = g - sg;
db = b - sb;

deltaAlpha((dr >= 0 & dg >= 0 & db >= 0) == 1) = 1;
deltaAlpha((dr <= 0 & dg <= 0 & db <= 0) == 1) = 1;
deltaAlpha(deltaAlpha == 0) = 0.5;

end

