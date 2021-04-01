function finalImage = blurImage(image, segResult)
%BLURIMAGE Blurs the background of image using Gaussian filter
    a = double(segResult);
    b = a == 1;
    c = uint8(b) .* image;
    alphachannel1 = double(c == 0);
    alphachannel2 = (c ~= 0);
    I1 = uint8(alphachannel2(:,:,1)) .* image;
    I2 = uint8(alphachannel1(:,:,1)) .* image;
    blurredImage = imgaussfilt(I2, 5);
    blurredImage = uint8(alphachannel1(:,:,1)) .* blurredImage;
    finalImage = I1 + blurredImage;
end

