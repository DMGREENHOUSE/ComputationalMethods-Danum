function times=timeArray()
    startTime = 0;
    endTime = 1000;
    timeStep = 1;
    times = linspace(startTime, endTime, 1+(endTime-startTime)/timeStep);
end
