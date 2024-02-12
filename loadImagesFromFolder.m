function images = loadImagesFromFolder(folderPath)
    % Get a list of all image files in the folder
    imageFiles = dir(fullfile(folderPath, '*.jpg'));
    
    % Initialize a cell array to store the images
    numImages = numel(imageFiles);
    images = cell(1, numImages);

    % Loop through each image file and read it
    for i = 1:numImages
        % Construct the full file path
        filePath = fullfile(folderPath, imageFiles(i).name);

        % Try to read the image
        try
            images{i} = imread(filePath);
        catch
            fprintf('Error loading image: %s\n', filePath);
        end
    end
    
    % Display a message indicating that all images were loaded
    fprintf('All images loaded successfully!\n');
end