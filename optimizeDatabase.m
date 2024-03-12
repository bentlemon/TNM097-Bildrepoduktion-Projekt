function optimizedImages = optimizeDatabase(images)
    numClusters = 50; % Database size ÄNDRA HÄR
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
    [~, clusterCenters] = kmeans(lab_data, numClusters);

    % Find closest objects to the cluster centers
    closestImages = cell(numClusters, 1);

    for j = 1:numClusters
        % Calculate distances to cluster center and find index of the closest object
        distancesToCenter = sum((lab_data - clusterCenters(j, :)).^2, 2);
        [~, minIdx] = min(distancesToCenter);

        % Assign the closest object to the cluster
        closestImages{j} = images{minIdx};
    end
     % output images
     optimizedImages = closestImages;
end
