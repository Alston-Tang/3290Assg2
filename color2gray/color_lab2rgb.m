function  img_rgb = color_lab2rgb( img_lab )
    [h,w,c] = size( img_lab );
    
    L = img_lab(:,:,1);
    A = img_lab(:,:,2);
    B = img_lab(:,:,3);
    
    p1 = [1/sqrt(3),0,0;0,1/sqrt(6),0;0,0,1/sqrt(2)];
    p2 = [1,1,1;1,1,-2;1,-1,0];
    q = [0.3811, 0.5783, 0.0402; 0.1967, 0.7244, 0.0782; 0.0241, 0.1288, 0.8444];
    pinv = inv(p1*p2);
    qinv = inv(q);
    
    % TODO: lab to log(LMS)
    
    logl = pinv(1) * L + pinv(4) * A + pinv(7) * B;
    logm = pinv(2) * L + pinv(5) * A + pinv(8) * B;
    logs = pinv(3) * L + pinv(6) * A + pinv(9) * B;
    
        
    % TODO: log(LMS) to LMS
    
    l = exp(logl);
    m = exp(logm);
    s = exp(logs);
    
    
    % TODO: LMS to RGB
    
    r = qinv(1) * l + qinv(4) * m + qinv(7) * s;
    g = qinv(2) * l + qinv(5) * m + qinv(8) * s;
    b = qinv(3) * l + qinv(6) * m + qinv(9) * s;
    
    % Output: img_rgb
    
    img_rgb = cat(3, r, g, b);

end