function img_res = color_transfer( img_src, img_tar )
    % img_src - input source image in Lab colorspace
    % img_tar - input target image in Lab colorspace
    % img_res - color transfered image from img_src to img_tar
    [hs,ws,cs] = size( img_src );
    [ht,wt,ct] = size( img_tar );
    
    LS = img_src(:,:,1);
    AS = img_src(:,:,2);
    BS = img_src(:,:,3);
    
    LT = img_tar(:,:,1);
    AT = img_tar(:,:,2);
    BT = img_tar(:,:,3);
    
    % TODO: calculate mean value for each channel of img_src & img_tar
    
    meanLS = mean2(LS);
    meanAS = mean2(AS);
    meanBS = mean2(BS);
    
    meanLT = mean2(LT);
    meanAT = mean2(AT);
    meanBT = mean2(BT);
    
    
    % TODO: calculate std value for each channel of img_src & img_tar
   
    stdLS = std2(LS);
    stdAS = std2(AS);
    stdBS = std2(BS);
    
    stdLT = std2(LT);
    stdAT = std2(AT);
    stdBT = std2(BT);
    
    % TODO: do color transfer
    
    LS = (LS - meanLS) * (stdLT / stdLS) + meanLT;
    AS = (AS - meanAS) * (stdAT / stdAS) + meanAT;
    BS = (BS - meanBS) * (stdBT / stdBS) + meanBT;
    
    
    
    % output img_res
    img_res = cat(3, LS, AS, BS);
end