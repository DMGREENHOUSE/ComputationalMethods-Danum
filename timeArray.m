function times=timeArray(targetOrbitTime, STEPNUMBER, COMPLETE_ORBITS)
    %endTime in years
    startTime = 0;
    if targetOrbitTime == 0
        endTime = 1; %case for the sun
    else
        endTime = round(targetOrbitTime, 3)*COMPLETE_ORBITS;
    end
    times = linspace(startTime, endTime, STEPNUMBER);
    timeStep = times(2) - times(1);
    if timeStep > 0.025
        sprintf('WARNING: the time step (%d years)is too large for Mercury to stay in orbit', timeStep)
        disp('Consider increasing the STEPNUMBER')
    end
    if timeStep > 0.0002
        sprintf('WARNING: the time step (%d years)is too large for Moons to stay in orbit', timeStep)
        disp('Consider increasing the STEPNUMBER')
    end
end
