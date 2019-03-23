function main()
    addpath(['Planets']);
    %This can all be rewritten
    times = timeArray();
    singlePlanetArray = zeros(length(times),7);
    planetMultiDArray = singlePlanetArray;
    planetNumber=2;
    for n=1:planetNumber
       planetMultiDArray(:,:,n) = singlePlanetArray; 
    end
    planetMultiDArray(1,:,1) = sun();%Rewrite the sun and all other planets
    planetMultiDArray(1,:,2) = earth();%Automatically calculate?
    %planetMultiDArray(1,:,3) = mercury();%Possible to add small deviations to denote a moon?
    %planetMultiDArray(1,:,4) = moon();
    
    populatedArray=iterate(planetMultiDArray, times);
    %disp(planetMultiDArray);
    plotIt(populatedArray)
end
