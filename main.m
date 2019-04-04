function main()
    addpath('Planets');
    
    %%%%% USER CHANGES %%%%%%%%%%%%%%%%%%%%%%%%%
    STEP_NUMBER = 5001; % This number will alter how long the programme runs for before plotting
    PLOT_FREQUENCY = 200; % This number will alter how long the programme runs for 
    COMPLETE_ORBITS = 1; % This number will alter the frame rate (how many days each frame contains)
    TARGET = "Earth"; % Which View? e.g. Earth
    SAVE_VIDEO = false;
    PLOT_RESIDUALS = false;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %Pre-define for speed
    planetMultiDArray = zeros(1, 9);
    colors = zeros(1, 3);
    % Will have form: 
    % each row = planet
    % across row (each column)[mass, radius, x, y, z, v_x, v_y, v_z, period]
    
    %Load all initial planet data
    [planetMultiDArray(1,:), names(1), colors(1,:), type(1), parent(1)] = sun();
    [planetMultiDArray(2,:), names(2), colors(2,:), type(2), parent(2)] = mercury();
    [planetMultiDArray(3,:), names(3), colors(3,:), type(3), parent(3)] = venus();
    [planetMultiDArray(4,:), names(4), colors(4,:), type(4), parent(4)] = earth();
    [planetMultiDArray(5,:), names(5), colors(5,:), type(5), parent(5)] = mars();
    [planetMultiDArray(6,:), names(6), colors(6,:), type(6), parent(6)] = jupiter();
    [planetMultiDArray(7,:), names(7), colors(7,:), type(7), parent(7)] = saturn();
    [planetMultiDArray(8,:), names(8), colors(8,:), type(8), parent(8)] = uranus();
    [planetMultiDArray(9,:), names(9), colors(9,:), type(9), parent(9)] = neptune();
    [planetMultiDArray(10,:), names(10), colors(10,:), type(10), parent(10)] = pluto();
    [planetMultiDArray(11,:), names(11), colors(11,:), type(11), parent(11)]= moon();
    %Look for moons and make necessary adjustment
    for i = 1:length(type)
        if type(i) == "Moon"
            parentIndex = find(contains(names, parent(i)));
            planetMultiDArray(i,:) = moonCalc(planetMultiDArray(i,:), planetMultiDArray(parentIndex,:));
        end
    end
    index = find(contains(names, TARGET));
    times = timeArray(planetMultiDArray(index, 9), STEP_NUMBER, COMPLETE_ORBITS);
    targetType = type(index);
    %Calculate positions of every object at all times
    [planetRadiusArray, planetPositionArray, newTimeArray] = iterate(planetMultiDArray, times, PLOT_FREQUENCY);
    plotIt3D(planetRadiusArray, planetPositionArray, newTimeArray, names, colors, index, targetType, PLOT_RESIDUALS, SAVE_VIDEO)
end
