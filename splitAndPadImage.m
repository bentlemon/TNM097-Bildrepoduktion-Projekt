function result = splitAndPadImage(inputImage, targetSize)
    % Hämta storlek på orginalbilden
    [originalHeight, originalWidth, ~] = size(inputImage);
    
    % Beräkna antalet rutor i höjd och bredd
    numVerticalTiles = floor(originalHeight / targetSize);
    numHorizontalTiles = floor(originalWidth / targetSize);
    
    % Beräkna den faktiska storleken på varje ruta
    actualSizeVertical = floor(originalHeight / numVerticalTiles);
    actualSizeHorizontal = floor(originalWidth / numHorizontalTiles);
    
    % Skapa en tom cell-array för resultatet
    result = cell(numVerticalTiles, numHorizontalTiles);
    
    % Loopa genom varje ruta och kopiera data från orginalbilden
    for i = 1:numVerticalTiles
        for j = 1:numHorizontalTiles
            % Hitta gränser för den aktuella rutan
            rowStart = (i - 1) * actualSizeVertical + 1;
            rowEnd = min(i * actualSizeVertical, originalHeight);
            colStart = (j - 1) * actualSizeHorizontal + 1;
            colEnd = min(j * actualSizeHorizontal, originalWidth);
            
            % Skapa en cell och kopiera data från orginalbilden
            result{i, j} = padarray(inputImage(rowStart:rowEnd, colStart:colEnd, :), ...
                                     [actualSizeVertical - (rowEnd - rowStart + 1), ...
                                      actualSizeHorizontal - (colEnd - colStart + 1)], 0, 'post');
        end
    end
end