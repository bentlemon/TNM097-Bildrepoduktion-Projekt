function calcsCIELAB(refImg, ogImg)

    refImgXYZ = rgb2xyz(refImg);
    ogImgXYZ = rgb2xyz(ogImg);
    % sampPerDegree ppi * d * tan(pi/180)
    % dist eye: 600 mm
    % ppi on my computer 157 
    sampPerDegree = 157 * 600/25.4 * tan(pi/180);
    whitePoint = [95.05, 100, 108.9]; % CIED65 standard illumination

    imgDiffSCIELAB = scielab(sampPerDegree, refImgXYZ, ogImgXYZ, whitePoint, 'xyz');

    % A small scielab --> a smaller difference between the two images
    meanimgSCIELAB = mean(mean(imgDiffSCIELAB));

    % Display the results
    disp(['Mean SCIELAB values: ' num2str(meanimgSCIELAB)]);

end