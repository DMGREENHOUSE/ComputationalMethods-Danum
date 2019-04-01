function main()
    addpath('Planets');
    %TODO: add more information to every sun/planet/moon
    % for example add the type which can then be used to workout if it
    % should be treated as a moon object here
    % also return the orbit period and so find the correct time
    % is it possible to automatically call all functions from the folder?
    % could even add labels to the graph?
    
    
    %Which View?
    %e.g. Earth
    index = 1;
    type = "solar system";
    target = sun();
    times = timeArray(target);
    
    singlePlanetArray = zeros(length(times),8);
    planetMultiDArray = singlePlanetArray;
    
    %Load all initial planet data
    planetMultiDArray(1,:,1) = sun();
    planetMultiDArray(1,:,2) = mercury();
    planetMultiDArray(1,:,3) = venus();
    planetMultiDArray(1,:,4) = earth();
    planetMultiDArray(1,:,5) = mars();
    planetMultiDArray(1,:,6) = jupiter();
    planetMultiDArray(1,:,7) = saturn();
    planetMultiDArray(1,:,8) = uranus();
    planetMultiDArray(1,:,9) = neptune();
    planetMultiDArray(1,:,10) = pluto();
    %Load all moon initial data
    %planetMultiDArray(1,:,11) = moonCalc(moon(), earth());
    
    populatedArray=iterate(planetMultiDArray, times);
    %Actually plotIt3D only really needs xyz
    %Speed up plotting by only providing required data
    plotIt3D(populatedArray, times, index, type)
end
