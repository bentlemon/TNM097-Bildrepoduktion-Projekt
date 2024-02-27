function optimizedImages = optimizeDatabase(images)

    numImages = numel(images);
    labImages = cell(1, numImages);

    % Convert the database images to LAB 
    for i = 1:numImages
        labImages{i} = rgb2lab(images{i});
    end

    % NEED TO CLUSTER THE IMAGES (k-mean)

    % best way?

    % -------------------

    deltaE_matrix = zeros(numImages);

    % Compute the DeltaE for the images
    for i = 1:numImages
        for j = i+1:numImages
            deltaE_matrix(i, j) = calcDeltaE(labImages{i}, labImages{j});
            deltaE_matrix(j, i) = deltaE_matrix(i, j);
        end
    end

    % Sorting and choosing the 
    meanDeltaE = mean(deltaE_matrix, 2); % 2: mean two times!
    [~, indices] = sort(meanDeltaE, 'descend');
    selectedIndices = indices(1:50);
    
    % Hämta de valda bilderna från ursprungliga bilder
    optimizedImages = images(selectedIndices);
end