function times=timeArray(endTime, STEPNUMBER)
    %endTime in years
    startTime = 0;
    times = linspace(startTime, endTime, STEPNUMBER);
    timeStep = times(2) - times(1);
    if timeStep > 0.025
        fprintf('WARNING: the time step (%d years)is too large for Mercury to stay in orbit\n', timeStep);
        disp('    Consider increasing the STEPNUMBER')
    end
    if timeStep > 0.0002
        fprintf('WARNING: the time step (%d years)is too large for Moons to stay in orbit\n', timeStep);
        disp('    Consider increasing the STEPNUMBER')
    end
    if STEPNUMBER > 10000
        fprintf('WARNING: the number of data points (%d )is very large and may require too much RAM\n', STEPNUMBER);
        disp('    Consider decreasing the STEPNUMBER')
    end
end 
