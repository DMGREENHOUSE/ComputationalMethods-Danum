function populatedArray=iterate(planetMultiDArray, times)
    PLANET_NUMBER = length(planetMultiDArray(1,1,:));
    tau = times(2)-times(1);
    for i=1:length(times)
        timePoint=planetMultiDArray(i,:,:);
        for j=1:PLANET_NUMBER
            targetPlanetState = timePoint(1,3:8,j);
            targetPlanetMass = timePoint(1,1,j);
            targetPlanetRadius = timePoint(1,2,j);
            otherPlanets = zeros(PLANET_NUMBER-1, 8);
            for k=1:PLANET_NUMBER
                if k<j
                    otherPlanets(k, :) = timePoint(1,:,k);
                end
                if k>j
                    otherPlanets(k-1, :) = timePoint(1,:,k);
                end
            end
            finalState = rk4(targetPlanetState,tau,@der, otherPlanets);
            planetMultiDArray(i+1,:,j) = [targetPlanetMass, targetPlanetRadius, finalState];
        end
    end
    populatedArray = planetMultiDArray;
end
