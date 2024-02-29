function choosenImg = matchingImgtoRef(choppedRefImg, optImg)
    % Skapa en tom cellmatris med samma storlek som choppedRefImg
    choosenImg = cell(size(choppedRefImg));

    for i = 1:size(choppedRefImg, 1)
        for j = 1:size(choppedRefImg, 2)
            % Fyll varje cell med en tom matris
            choosenImg{i, j} = zeros(size(choppedRefImg{i, j}));
            
            refImg_lab = rgb2lab(choppedRefImg{i, j}); % få labvärden för ref-bilden
            minDeltaE = inf; % startvärde

            for k = 1:numel(optImg)
                optImg_lab = rgb2lab(optImg{k});

                % beräkna delta E -- MÅSTE VARA SAMMA STORLEK (fixat)
                deltaE = calcDeltaE(refImg_lab, optImg_lab);
                deltaEMean = mean(deltaE(:));

                if deltaEMean < minDeltaE
                    minDeltaE = deltaEMean;
                    % Lägg in optImg i den tomma matrisen
                    choosenImg{i, j} = optImg{k};
                end
            end
        end
    end
end
