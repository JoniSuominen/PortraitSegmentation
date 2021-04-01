function finalImage = changeBackground(foreImage, backImage, segResult)
%BLURIMAGE Changes the background of the image to the image defined as
%backImage
    backImage = imresize(backImage, [512 512]);
    a = double(segResult);
    b = a == 1;
    c = uint8(b) .* foreImage;
    alphachannel1 = double(c == 0);
    alphachannel2 = (c ~= 0);
    I1 = uint8(alphachannel2(:,:,1)) .* foreImage;
    I2 = uint8(alphachannel1(:,:,1)) .* foreImage;
    blurredImage = uint8(alphachannel1(:,:,1)) .* backImage;
    finalImage = I1 + blurredImage;
end

