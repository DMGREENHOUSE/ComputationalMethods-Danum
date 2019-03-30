function times=timeArray()
    startTime = 0;
    endTime = 5;
    tau = 0.01;
    times = linspace(startTime, endTime, 1+(endTime-startTime)/tau);
end
