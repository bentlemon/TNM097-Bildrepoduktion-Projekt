function [deltaE] = calcDeltaE(Lab1,Lab2)
    
    L1 = Lab1(:,:,1);
    a1 = Lab1(:,:,2);
    b1 = Lab1(:,:,3);
    
    L2 = Lab2(:,:,1);
    a2 = Lab2(:,:,2);
    b2 = Lab2(:,:,3);
    
    deltaE = sqrt((L1 - L2).^2 + (a1 - a2).^2 + (b1 - b2).^2);

end