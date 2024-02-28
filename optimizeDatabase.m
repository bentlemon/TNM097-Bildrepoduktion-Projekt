function optimizedImages = optimizeDatabase(images)

    numImages = numel(images);
    labImages = cell(1, numImages);

    % Convert the database images to LAB 
    for i = 1:numImages
        labImages{i} = rgb2lab(images{i});
    end

    % Reshape/flatten each LAB image into a 1D vector
    lab_flat = cell(numImages, 1);
    for i = 1:numImages
        lab_flat{i} = reshape(labImages{i}, 1, []); 
    end

    % Convert cell array to matrix for k-means
    lab_data = cell2mat(lab_flat);

    % Perform k-means clustering
    numClusters = 50; % Adjust as needed
    [idx, clusterCenters] = kmeans(lab_data, numClusters);

    % Find closest objects to the cluster centers
    closestImages = cell(numClusters, 1);
    for j = 1:numClusters
        % Calculate distances to cluster center and find index of the closest object
        distancesToCenter = sum((lab_data - clusterCenters(j, :)).^2, 2);
        [~, minIdx] = min(distancesToCenter);

        % Assign the closest object to the cluster
        closestImages{j} = images{minIdx};
    end

    meanDeltaE = mean(labImages, 2); % 2: mean two times!

    % Combine clustering and DeltaE information for ranking
    clusterWeight = 0.7; % Adjust the weight based on importance
    meanCluster = mean(idx, 2);

    % Combine DeltaE and clustering information
    combinedScore = clusterWeight * meanCluster + (1 - clusterWeight) * meanDeltaE;

    % Sorting and choosing the top 50 images
    [~, indices] = sort(combinedScore, 'descend');
    selectedIndices = indices(1:50);

    % Fetch the selected images from the original images
    optimizedImages = images(selectedIndices);
end
