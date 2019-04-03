function main()
    addpath('Planets');
    %TODO: add more information to every sun/planet/moon
    % for example add the type which can then be used to workout if it
    % should be treated as a moon object here
    % also return the orbit period and so find the correct time
    % is it possible to automatically call all functions from the folder?
    % could even add labels to the graph?
    
    % How many time points? This determines the length that the application
    % runs for
    STEP_NUMBER = 1001;
    PLOT_FREQUENCY = 10;
    COMPLETE_ORBITS = 2;
    %Which View? e.g. Earth
    TARGET = "Sun";
    
    %Pre-define for speed
    singlePlanetArray = zeros(STEP_NUMBER, 9);
    planetMultiDArray = singlePlanetArray;
    colors = zeros(1, 3);
    
    %Load all initial planet data
    [planetMultiDArray(1,:,1), names(1), colors(1,:), type(1), parent(1)] = sun();
    [planetMultiDArray(1,:,2), names(2), colors(2,:), type(2), parent(2)] = mercury();
    [planetMultiDArray(1,:,3), names(3), colors(3,:), type(3), parent(3)] = venus();
    [planetMultiDArray(1,:,4), names(4), colors(4,:), type(4), parent(4)] = earth();
    [planetMultiDArray(1,:,5), names(5), colors(5,:), type(5), parent(5)] = mars();
    [planetMultiDArray(1,:,6), names(6), colors(6,:), type(6), parent(6)] = jupiter();
    [planetMultiDArray(1,:,7), names(7), colors(7,:), type(7), parent(7)] = saturn();
    [planetMultiDArray(1,:,8), names(8), colors(8,:), type(8), parent(8)] = uranus();
    [planetMultiDArray(1,:,9), names(9), colors(9,:), type(9), parent(9)] = neptune();
    [planetMultiDArray(1,:,10), names(10), colors(10,:), type(10), parent(10)] = pluto();
    [planetMultiDArray(1,:,11), names(11), colors(11,:), type(11), parent(11)]= moon();
    %Look for moons and make necessary adjustment
    for i = 1:length(type)
        if type(i) == "Moon"
            parentIndex = find(contains(names, parent(i)));
            %disp(planetMultiDArray(1,:,i))
            planetMultiDArray(1,:,i) = moonCalc(planetMultiDArray(1,:,i), planetMultiDArray(1,:,parentIndex));
            %disp(planetMultiDArray(1,:,i))
        end
    end
    
    index = find(contains(names, TARGET));
    times = timeArray(planetMultiDArray(1,9,index), STEP_NUMBER, COMPLETE_ORBITS);
    targetType = type(index);
    %Calculate positions of every object at all times
    populatedArray=iterate(planetMultiDArray, times);
    %Speed up plotting by only providing required data
    planetRadiusArray = populatedArray(1,2,:);
    planetPositionArray = populatedArray(:,3:5,:);
    plotIt3D(planetRadiusArray, planetPositionArray, times, names, colors, index, targetType, PLOT_FREQUENCY)
end
