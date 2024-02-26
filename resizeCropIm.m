function croppedResizedImgs = resizeCropIm(inputImages, targetSize)
    numImages = numel(inputImages);
    croppedResizedImgs = cell(1, numImages);

    for i = 1:numImages
        % Read the original image
        originalImage = inputImages{i};

        % Resize the image to the target size
        resizedImage = imresize(originalImage, [targetSize, targetSize]);

        % Store the resized image in the output cell array
        croppedResizedImgs{i} = resizedImage;
    end
end