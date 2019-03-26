function times=timeArray()
    startTime = 0;
    endTime = 2592000*120;
    tau = 2592000/4;
    times = linspace(startTime, endTime, 1+(endTime-startTime)/tau);
end
