function resultingImage = combineImage(reconImg)

    % Initialize resultingImage outside the loop
    resultingImage = [];

    % Loop through and combine the matched images
    for i = 1:size(reconImg, 1)
        rowImages = [];
        for j = 1:size(reconImg, 2)
            % Combine the images horizontally in each row
            rowImages = cat(2, rowImages, reconImg{i, j});
        end
        % Combine the rows vertically to form a single image
        resultingImage = cat(1, resultingImage, rowImages);
    end

end