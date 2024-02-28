function visualizeClusters(images, idx, clusterCenters)
    numClusters = size(clusterCenters, 1);

    figure;
    for j = 1:numClusters
        subplot(2, numClusters, j);
        imshow(images{idx == j}{1});
        title(['Cluster ' num2str(j) ' Image']);

        subplot(2, numClusters, j + numClusters);
        imshow(reshape(clusterCenters(j, :), size(images{1})));
        title(['Cluster ' num2str(j) ' Centroid']);
    end
end
