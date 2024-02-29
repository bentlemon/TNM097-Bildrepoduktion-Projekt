function choppedRefImg = cutRefImg(imageRef, targetSize)

    [rows, col, numberOfColorBands] = size(imageRef);

    % Calculate the number of blocks in each dimension
    blockRows = floor(rows / targetSize);
    blockCol = floor(col / targetSize);

    % Calculate the actual size of each block in each dimension
    blockSizeRows = floor(rows / blockRows);
    blockSizeCol = floor(col / blockCol);

    % Create arrays specifying the size of each block in each dimension
    blockArrayRows = [blockSizeRows * ones(1, blockRows), rem(rows, blockSizeRows)];
    blockArrayCol = [blockSizeCol * ones(1, blockCol), rem(col, blockSizeCol)];

    % Chop the image into a cell array
    choppedRefImg = mat2cell(imageRef, blockArrayRows, blockArrayCol, numberOfColorBands);
 
end