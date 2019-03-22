function populatedArray=iterate(planetMultiDArray, times, tau)
    PLANET_NUMBER = length(planetMultiDArray(1,1,:));
    for i=1:length(times)
        timePoint=planetMultiDArray(i,:,:);
        for j=1:PLANET_NUMBER
        	%Function call returning new x, new y...;
            targetPlanet = timePoint(1,:,j);
            acceleration = [0,0,0];
            for k=1:PLANET_NUMBER
                if k~=j
                    %enter to force calc
                    r1=targetPlanet(2)-timePoint(1,2,k);
                    r2=targetPlanet(3)-timePoint(1,3,k);
                    r3=targetPlanet(4)-timePoint(1,4,k);
                    r=[r1,r2,r3];
                    kthPlanetMass = timePoint(1,1,k);
                    accFromKthPlanet = gravityAccCalc(kthPlanetMass, r);
                    acceleration = acceleration + accFromKthPlanet;
                end
            end
            %temporarily populate state with acceleration values (replaces
            %r (2->4)
            state = timePoint(1,2:7,j);
            state = rk4(state,times(i),tau,@der, acceleration);
            planetMultiDArray(i+1,:,j) = [targetPlanet(1), state];
        end
    end
    populatedArray = planetMultiDArray;
end
