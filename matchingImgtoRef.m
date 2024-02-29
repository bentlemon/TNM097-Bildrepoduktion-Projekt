function matchedImgs = matchingImgtoRef(choppedRefImg, optImg)
    
    % ta in labvärden för båda delarna
    % skapa en tom matris med samma storlek som choppedRefImg
    % Loopa igenom choppedRefImg 
    % Loop för att matcha det minsta delta E:et mellan optImg och ref
    % if sats --> om E_new (mean) < E_old --> bäst match för ref{i}
    % Lägg in optImg i den tomma matrisen
    % returnera :D

    numRefImg = numel(choppedRefImg);
    numOptImg = numel(optImg);
    matchedImgs = cell(1, numImages);
    deltaE = 0.0;
    minDeltaE = inf; 

    for i = 1:numRefImg
        for j = 1:numRefImg
            refImg_lab = rgb2lab(choppedRefImg{i, j}); % get the lab for ref
            for k = 1:numOptImg
                optImg_lab = rgb2lab(optImg{k});
                
                % calc delta E -- MÅSTE VARa SAMMA STORLEK
                deltaE = calcDeltaE(refImg_lab, optImg_lab);
                
                if deltaE 
    
                end
                
    
            end
        end
    end


end