function [planetRadiusArray, planetPositionArray, newTimeArray] = iterate(oldArray, times, PLOT_FREQUENCY)
    count = 1;
    planetRadiusArray = oldArray(:, 2);
    PLANET_NUMBER = length(planetRadiusArray);
    tau = times(2)-times(1);
    previousTimePoint = oldArray;
    % Predefine for speed
    totalTimePoints = length(times);
    timePoints = floor(totalTimePoints/PLOT_FREQUENCY);
    populatedArray = zeros(timePoints, 9, PLANET_NUMBER);
    newTimeArray = zeros(timePoints);
    for i=1:totalTimePoints
        for j=1:PLANET_NUMBER
            targetPlanetState = previousTimePoint(j, 3:8);
            targetPlanetMass = previousTimePoint(j, 1);
            targetPlanetRadius = previousTimePoint(j, 2);
            targetPlanetOrbitTime = previousTimePoint(j, 9);
            otherPlanets = zeros(PLANET_NUMBER-1, 9);
            for k = 1:PLANET_NUMBER
                if k < j
                    otherPlanets(k, :) = previousTimePoint(k, :);
                end
                if k > j
                    otherPlanets(k-1, :) = previousTimePoint(k, :);
                end
            end
            finalState = rk4(targetPlanetState,tau,@der, otherPlanets);
            previousTimePoint(j,:) = [targetPlanetMass, targetPlanetRadius, finalState, targetPlanetOrbitTime];
        end
        % Reduce required memory by only storing necessary values and
        % binning all others
        if mod(i, PLOT_FREQUENCY) == 0
            populatedArray(count,:,:) = previousTimePoint(:,:).'; % Transpose
            newTimeArray(count) = times(i); % Record the time this data slice is being taken
            count = count+1;
        fprintf('Progress: %d %%\n', round(i/totalTimePoints, 2)*100);
        end
    end
    planetPositionArray = populatedArray(:,3:5,:);
    if timePoints > 1000
        fprintf('WARNING: the number of data points being plotted (%d )is very large and may cause the animation to run for too long\n', timePoints);
        disp('    Consider decreasing the STEPNUMBER or increasing the PLOT_FREQUENCY')
    end
end
