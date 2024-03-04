function calcsCIELAB(refImg)
    imgReSizeNear = imresize(imresize(refImg, 0.25, 'nearest'), 4, 'nearest');
    imgReSizeBilin = imresize(imresize(refImg, 0.25, 'bilinear'), 4, 'bilinear');
    imgReSizeBicub = imresize(imresize(refImg, 0.25, 'bicubic'), 4, 'bicubic');

    refImgXYZ = rgb2xyz(refImg);
    imgReSizeNearXYZ = rgb2xyz(imgReSizeNear);
    imgReSizeBilinXYZ = rgb2xyz(imgReSizeBilin);
    imgReSizeBicubXYZ = rgb2xyz(imgReSizeBicub);

    % sampPerDegree ppi * d * tan(pi/180)
    % dist eye: 600 mm
    % ppi on my computer 157 
    sampPerDegree = 157 * 600/25.4 * tan(pi/180);
    whitePoint = [95.05, 100, 108.9]; % CIED65 standard illumination

    imgReSizeNearDiffSCIELAB = scielab(sampPerDegree, refImgXYZ, imgReSizeNearXYZ, whitePoint, 'xyz');
    imgReSizeBilinDiffSCIELAB = scielab(sampPerDegree, refImgXYZ, imgReSizeBilinXYZ, whitePoint, 'xyz');
    imgReSizeBicubDiffSCIELAB = scielab(sampPerDegree, refImgXYZ, imgReSizeBicubXYZ, whitePoint, 'xyz');

    % A small scilab --> a smaller difference between the two images
    meanNearSCIELAB = mean(mean(imgReSizeNearDiffSCIELAB));
    meanBilinSCIELAB = mean(mean(imgReSizeBilinDiffSCIELAB));
    meanBicubSCIELAB = mean(mean(imgReSizeBicubDiffSCIELAB));

    % Display the results
    disp('Mean SCIELAB values:');
    disp(['Near: ', num2str(meanNearSCIELAB)]);
    disp(['Bilinear: ', num2str(meanBilinSCIELAB)]);
    disp(['Bicubic: ', num2str(meanBicubSCIELAB)]);
end