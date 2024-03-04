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
% MAKE A SCIELAB & SNR COMPARESENSE WITH ORG REF AND RECONSTRUCTEDS

% Load in the images
folderPath = '../TNM097-Bildrepoduktion-Projekt/Images/CAT_00';
loadedImages = loadImagesFromFolder(folderPath); % Function

% Ref images
imageRef = im2double(imread("ref_image_cat.jpg")); % Potrait light
%imageRef = im2double(imread("ref_maxwell_backrooms.jpg")); % Potrait dark
%imageRef = im2double(imread("ref_maxwell.jpg")); % Landskap

% Set the target size for the square image (?x? pixels big)
targetSize = 20;  

% Call the function to crop and resize the database images
croppedResizedImgs = resizeCropIm(loadedImages, targetSize);

optImg = optimizeDatabase(croppedResizedImgs); % preforming k-mean

resizedImage = imgResize(imageRef, [3024, 3024]);
choppedRefImg = splitAndPadImage(resizedImage, targetSize);

reconImg = matchingImgtoRef(choppedRefImg, optImg);

resultImg = combineImage(reconImg);

% SCIELAB AND SNR results
calcsCIELAB(resultImg);

% Show result!
%imshow(resultImg);