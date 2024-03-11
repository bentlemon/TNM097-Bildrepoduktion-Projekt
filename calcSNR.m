function calcedSNR = calcSNR(refImg, reconImgNoise)
 
    % NOT MY FUNCTION!!!!!!!
    % out=mysnr(in, noise);
    %
    % in is the original image
    % noise is the difference between the original image and the reproduction
    % (i.e. the halftoned image)
    % out returns the SNR

    calcedSNR = 10*log10(sum(refImg(:).^2)/sum(reconImgNoise(:).^2));

    % Display the results
    disp(['SNR value:' , num2str(calcedSNR)]);
end