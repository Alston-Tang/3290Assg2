function delta = calcDelta( l, a, b, dy, dx )    
    if dy ~= 0
        dl = circshift(l, dy, 1);
        da = circshift(a, dy, 1);
        db = circshift(b, dy, 1);
    end
    if dx ~= 0
        dl = circshift(l, dx, 2);
        da = circshift(a, dx, 2);
        db = circshift(b, dx, 2);
    end
    postive = l - dl;
    postive(postive > 0) = 1;
    postive(postive < 0) = -1;
    
    delta = sqrt((l - dl).^2 + (a - da).^2 + (b - db).^2) .* postive;
end

