
function main()
    %This can all be rewritten
    times = timeArray();
    tau = 0.001;
    singlePlanetArray = zeros(length(times),7);
    planetMultiDArray = singlePlanetArray;
    planetNumber=4;
    for n=1:planetNumber
       planetMultiDArray(:,:,n) = singlePlanetArray; 
    end
    planetMultiDArray(1,:,1) = sun();%Rewrite the sun and all other planets
    planetMultiDArray(1,:,2) = earth();%Automatically calculate?
    planetMultiDArray(1,:,3) = moon();%Possible to add small deviations to denote a moon?
    planetMultiDArray(1,:,4) = mercury();
    
    populatedArray=iterate(planetMultiDArray, times, tau);
    disp(planetMultiDArray);
    
    plotIt(populatedArray)
end

