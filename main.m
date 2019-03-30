function main()
    addpath('Planets');
    times = timeArray();
    singlePlanetArray = zeros(length(times),8);
    planetMultiDArray = singlePlanetArray;
    %This can all be rewritten
    planetMultiDArray(1,:,1) = sun();
    planetMultiDArray(1,:,2) = mercury();
    planetMultiDArray(1,:,3) = earth();
    planetMultiDArray(1,:,4) = mars();
    planetMultiDArray(1,:,5) = jupiter();
    planetMultiDArray(1,:,6) = saturn();
    planetMultiDArray(1,:,7) = uranus();
    planetMultiDArray(1,:,8) = neptune
    planetMultiDArray(1,:,9) = pluto();
    
    populatedArray=iterate(planetMultiDArray, times);
    %plotIt2D(populatedArray)
    plotIt3D(populatedArray, times)
end
