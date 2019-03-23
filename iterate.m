function populatedArray=iterate(planetMultiDArray, times)
    PLANET_NUMBER = length(planetMultiDArray(1,1,:));
    tau = times(2)-times(1);
    for i=1:length(times)
        timePoint=planetMultiDArray(i,:,:);
        for j=1:PLANET_NUMBER
            disp("NEWPLANET: " + j + "         Time: " + i)
            
            targetPlanetState = timePoint(1,2:7,j)
            targetPlanetMass = timePoint(1,1,j);
            deltaState = [0,0,0,0,0,0];
            for k=1:PLANET_NUMBER
                if k~=j
                    kthPlanetState = timePoint(1,2:7,k)
                    kthPlanetMass = timePoint(1,1,k);
                    % find state of target relative to the kth planets
                    relativeState = targetPlanetState - kthPlanetState;
                    %correct r as necessary (re-add on distance from other
                    %planet)
                    relativeState = rk4(relativeState,times(i),tau,@der, kthPlanetMass);
                    % displacement and velocity corrections
                    deltaState = deltaState + kthPlanetState + relativeState - targetPlanetState;
                end
            end
            finalState = targetPlanetState + deltaState;
            planetMultiDArray(i+1,:,j) = [targetPlanetMass, finalState];
            %planetMultiDArray(i+1,:,1) = [1, 0, 0, 0, 0, 0, 0];
        end
    end
    populatedArray = planetMultiDArray;
end
