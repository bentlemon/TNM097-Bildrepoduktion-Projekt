function visualizeChoppedImages(choppedRefImg)
    numRowBlocks = size(choppedRefImg, 1);
    numColBlocks = size(choppedRefImg, 2);

    % Create a figure to display the chopped images
    figure;

    % Loop through each block and display the images
    for i = 1:numRowBlocks
        for j = 1:numColBlocks
            subplot(numRowBlocks, numColBlocks, (i-1)*numColBlocks + j);
            imshow(choppedRefImg{i, j});
            title(['Block ', num2str((i-1)*numColBlocks + j)]);
        end
    end
end