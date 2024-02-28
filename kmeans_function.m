function closest_objects = kmeans_function(img_array, k)
    % Function to perform k-means clustering and find closest objects to cluster centers
    
    % Reshape/flatten each image into a 1D vector
    num_images = numel(img_array); 
    data_flat = cell(num_images, 1);
    for i = 1:num_images
        data_flat{i} = reshape(img_array{i}, 1, []); 
    end

    % Concatenate the 1D vectors vertically
    data = vertcat(data_flat{:}); % Convert cell array to matrix for k-means
    
    % Perform k-means clustering
    [~, centroids] = kmeans(data, k);
    
    % Find closest objects to the cluster centers
    closest_objects = cell(k, 1);
    for j = 1:k
        % Calculate distances to centroid and find index of the closest object to centroid
        distances_to_centroid = sum((data - centroids(j, :)).^2, 2);
        [~, min_idxs] = min(distances_to_centroid); 

        % Assign the closest object to the cluster
        closest_objects{j} = img_array{min_idxs};
    end
end