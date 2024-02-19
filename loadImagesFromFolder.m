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

        % Read the image and convert to double
        img = imread(filePath);
        img_double = im2double(img);

        % Store the double image in the cell array
        images{i} = img_double;
    end
end