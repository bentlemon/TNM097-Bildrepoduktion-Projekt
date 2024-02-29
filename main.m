% Struktur:
% - Importera bilderna från CAT_00 folder (X)
% - Croppa bilderna så de blir samma storlek (X)
% - Minska databasen från ~300 bilder till 50 st genom färgskillnad (X)
% - Spara alla bilder i en ny array av bilder (X)
% - Choppa upp ref bilden i taget size, spara som en matris (X)
% - Jämför varje genom deltaE --> minsta tal ger den bästa matchen till
% rutan ()
% - spara den bilden (från optImg{i}) i en tom matris ()
% - rekonstuera bilden ()
% MAKE A SCIELAB COMPARESENSE WITH ORG REF AND RECONSTRUCTEDS

% Load in the images
folderPath = "C:\Users\mahon\Desktop\Cappy_spel\TNM097-Bildrepoduktion-Projekt\Images\CAT_00";
loadedImages = loadImagesFromFolder(folderPath); % Function

% Ref images
imageRef = im2double(imread("ref_image_cat.jpg")); % Image is 3010x3010x3

% Set the target size for the square image (?x? big)
targetSize = 500;  

% Call the function to crop and resize the images
croppedResizedImgs = resizeCropIm(loadedImages, targetSize);

optImg = optimizeDatabase(croppedResizedImgs); % preforming k-mean

choppedRefImg = cutRefImg(imageRef, targetSize);
%visualizeChoppedImages(choppedRefImg); % for visualization of the ref im



