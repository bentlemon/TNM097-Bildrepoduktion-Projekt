function resizedImg = imgResize(img, targetSize)
    % Check if the image is smaller than the target size
    if size(img, 1) < targetSize(1) || size(img, 2) < targetSize(2)
        warning('Image is smaller than the target size!!');
    end

    % Resize the image to the target size
    resizedImg = imresize(img, targetSize);
end