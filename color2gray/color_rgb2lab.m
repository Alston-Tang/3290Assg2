function img_lab = color_rgb2lab( img_rgb )
    [h,w,c] = size( img_rgb );
    
    r = img_rgb(:,:,1);
    g = img_rgb(:,:,2);
    b = img_rgb(:,:,3);
    
    q = [0.3811, 0.5783, 0.0402; 0.1967, 0.7244, 0.0782; 0.0241, 0.1288, 0.8444];
    % TODO: RGB to LMS
    
    l = q(1) * r + q(4) * g + q(7) * b;
    m = q(2) * r + q(5) * g + q(8) * b;
    s = q(3) * r + q(6) * g + q(9) * b;
    
    % TODO: LMS to log(LMS)
    
    l(l<eps) = eps;
    m(m<eps) = eps;
    s(s<eps) = eps;
    
    logl = log(l);
    logm = log(m);
    logs = log(s);
    
    % TODO: log(LMS) to lab
    
    p1 = [1/sqrt(3),0,0;0,1/sqrt(6),0;0,0,1/sqrt(2)];
    p2 = [1,1,1;1,1,-2;1,-1,0];
    p = p1 * p2;
    
    L = p(1) * logl + p(4) * logm + p(7) * logs;
    A = p(2) * logl + p(5) * logm + p(8) * logs;
    B = p(3) * logl + p(6) * logm + p(9) * logs;
    
    
    % Output: img_lab
    
    img_lab = cat(3, L, A, B);
end

