function populatedArray=iterate(planetMultiDArray, times)
    PLANET_NUMBER = length(planetMultiDArray(1,1,:));
    tau = times(2)-times(1);
    for i=1:length(times)
        timePoint=planetMultiDArray(i,:,:);
        for j=1:PLANET_NUMBER
            disp("NEWPLANET: " + j + "         Time: " + i)
            
            targetPlanetState = timePoint(1,2:7,j);
            targetPlanetMass = timePoint(1,1,j);
            deltaState = [0,0,0,0,0,0];
            for k=1:PLANET_NUMBER
                if k~=j
                    kthPlanetState = timePoint(1,2:7,k);
                    kthPlanetMass = timePoint(1,1,k);
                    % find state of target relative to the kth planets
                    if k<j
                        relativeState = targetPlanetState - kthPlanetState;
                    %correct r as necessary (re-add on distance from other
                    %planet)
                    else
                        relativeState = -targetPlanetState + kthPlanetState;
                    end
                    relativeChange = rk4(relativeState,tau,@der, kthPlanetMass);
                    % displacement and velocity corrections
                    deltaState = deltaState + relativeChange;
                end
                %%%%THE SUN's DATA IS BEING SAVED THE SAME AS THE EARTHS
            end
            finalState = targetPlanetState + deltaState
            planetMultiDArray(i+1,:,j) = [targetPlanetMass, finalState];
            %planetMultiDArray(i+1,:,1) = [1.989*10^30, 0, 0, 0, 0, 0, 0];
        end
    end
    populatedArray = planetMultiDArray;
end
