% Struktur:
% - Importera bilderna från CAT_00 folder
% - Minska databasen från ~300 bilder till 50 st genom färgskillnad
% - Spara alla bilder i en ny array av bilder
% - Croppa bilderna så de blir samma storlek

% Ref image for the recontructed one

% Load in the images
folderPath = "C:\Users\mahon\Desktop\Cappy_spel\TNM097-Bildrepoduktion-Projekt\Images\CAT_00";
loadedImages = loadImagesFromFolder(folderPath); % Function

imageRef = im2double(imread("ref_image_cat.jpg")); % Image is 3010x3010x3
% Next task: Find the best color comparsion method! CIELAB? 

% TEST IMAGES %
image1 = imread("Images\CAT_00\00000078_009.jpg");
image2 = imread("Images\CAT_00\00000338_013.jpg");
image3 = imread("Images\CAT_00\00000337_000.jpg");

images = {image1, image2, image3};

% Set the target size for the square image
targetSize = 256;  % Adjust as needed

% Call the function to crop and resize the images
croppedResizedImgs = resizeCropIm(images, targetSize);

% Create a reference image (white in this example)
referenceImage = 255 * ones(3010, 3010, 3, 'uint8');  % White image

% Set the size of each smaller image in the grid
smallerImageSize = 60;  % 10x10 pixels

% Arrange the smaller images in a grid inside the reference image
numRows = ceil(sqrt(numel(croppedResizedImgs)));
numCols = ceil(numel(croppedResizedImgs) / numRows);

% Calculate the size of the grid cells
cellSize = smallerImageSize;

% Place the smaller images in the grid
for i = 1:numel(croppedResizedImgs)
    row = floor((i - 1) / numCols) + 1;
    col = mod(i - 1, numCols) + 1;
    
    % Calculate the position in the reference image
    xPos = (col - 1) * cellSize + 1;
    yPos = (row - 1) * cellSize + 1;
    
    % Paste the 10x10 pixels from the smaller image into the reference image
    referenceImage(yPos:yPos + smallerImageSize - 1, xPos:xPos + smallerImageSize - 1, :) = croppedResizedImgs{i}(1:smallerImageSize, 1:smallerImageSize, :);
end

% Display the reference image with 10x10 pixels for each smaller image
imshow(referenceImage);
title('Reference Image test');