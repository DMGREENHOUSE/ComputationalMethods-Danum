function times=timeArray(target)
    %For now, reverse calculate the velocity
    %endTime in years
    dist = target(4);
    speed = target(6);
    startTime = 0;
    if speed == 0 || dist ==0
        endTime = 1;
    else
        period = abs(2*pi*dist/speed);
        endTime = period*5/100;
    end
    stepNumber = 100;
    times = linspace(startTime, endTime, stepNumber+1);
end
