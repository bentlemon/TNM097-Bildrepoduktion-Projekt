% Struktur:
% - Importera bilderna från CAT_00 folder (X)
% - Croppa bilderna så de blir samma storlek (X)
% - Minska databasen från ~300 bilder till 50 st genom färgskillnad (X)
% - Spara alla bilder i en ny array av bilder (X)
% - Choppa upp ref bilden i taget size, spara som en matris (X)
% - Jämför varje genom deltaE --> minsta tal ger den bästa matchen till
%   rutan (X)
% - spara den bilden (från optImg{i}) i en tom matris (X)
% - rekonstuera bilden (X)
% MAKE A SCIELAB COMPARESENSE WITH ORG REF AND RECONSTRUCTEDS

% Load in the images
folderPath = "C:\Users\mahon\Desktop\Cappy_spel\TNM097-Bildrepoduktion-Projekt\Images\CAT_00";
loadedImages = loadImagesFromFolder(folderPath); % Function

% Ref images
%imageRef = im2double(imread("ref_image_cat.jpg")); % Image is 3010x3010x3
%imageRef = im2double(imread("ref_maxwell.jpg")); % Landskap
imageRef = im2double(imread("ref_maxwell_backrooms.jpg")); % dark image

% Set the target size for the square image (?x? big)
targetSize = 20;  

% Call the function to crop and resize the images
croppedResizedImgs = resizeCropIm(loadedImages, targetSize);

optImg = optimizeDatabase(croppedResizedImgs); % preforming k-mean

% Check if the original image is smaller than 3000x3000
if size(imageRef, 1) < 3000 || size(imageRef, 2) < 3000
    disp('OBS!! Bilden kommer att skalas upp eftersom den är mindre än 3000x3000, vilket påverkar slutresultatet!!');
end

resizedImage = imresize(imageRef, [3000, 3000]);
choppedRefImg = splitAndPadImage(resizedImage, targetSize);

reconImg = matchingImgtoRef(choppedRefImg, optImg);

% Skapa en tom variabel för den sammanhängande bilden
combinedImage = [];

% Loopa igenom och kombinera de matchade bilderna
for i = 1:size(reconImg, 1)
    rowImages = [];
    for j = 1:size(reconImg, 2)
        % Kombinera bilderna horisontellt i varje rad
        rowImages = cat(2, rowImages, reconImg{i, j});
    end
    % Kombinera raderna vertikalt för att bilda en enda bild
    combinedImage = cat(1, combinedImage, rowImages);
end

calcsCIELAB(combinedImage, resizedImage);
calcSNR(resizedImage , abs(resizedImage - combinedImage));

% Visa den sammanhängande bilden
imshow(combinedImage);