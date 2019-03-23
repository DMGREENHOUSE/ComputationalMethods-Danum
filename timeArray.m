function times=timeArray()
    startTime = 0;
    endTime = 31104000;
    tau = 2592000;
    times = linspace(startTime, endTime, 1+(endTime-startTime)/tau);
end
