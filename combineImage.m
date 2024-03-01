function resultingImage = combineImage(reconImg)

    % Loopa igenom och kombinera de matchade bilderna
    for i = 1:size(reconImg, 1)
        rowImages = [];
        for j = 1:size(reconImg, 2)
            % Kombinera bilderna horisontellt i varje rad
            rowImages = cat(2, rowImages, reconImg{i, j});
        end
        % Kombinera raderna vertikalt för att bilda en enda bild
        resultingImage = cat(1, combinedImage, rowImages);
    end

end