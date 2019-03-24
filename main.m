function main()
    addpath('Planets');
    times = timeArray();
    singlePlanetArray = zeros(length(times),8);
    planetMultiDArray = singlePlanetArray;
    %This can all be rewritten
    planetMultiDArray(1,:,1) = sun();
    planetMultiDArray(1,:,2) = earth();
    planetMultiDArray(1,:,3) = mercury();
    planetMultiDArray(1,:,4) = moon();
    planetMultiDArray(1,:,5) = venus();
    planetMultiDArray(1,:,6) = jupiter();
    
    populatedArray=iterate(planetMultiDArray, times);
    %plotIt2D(populatedArray)
    plotIt3D(populatedArray)
end
