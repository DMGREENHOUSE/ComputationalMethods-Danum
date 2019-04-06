function main()
    addpath('Planets');
    
    %%%%% USER CHANGES %%%%%%%%%%%%%%%%%%%%%%%%%
    LOAD_SAVED_DATA = true;
    PLOT = true;
    STEP_NUMBER = 10001; % This number will alter how long the programme runs for before plotting
    TOTAL_TIME = 2; % [years] This number will alter how long the programme runs for before plotting
    PLOT_PACE = 0.1;
    TARGET = "Sun"; % Which View? e.g. Earth
    SAVE_VIDEO = false;
    PLOT_RESIDUALS = false;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    times = timeArray(TOTAL_TIME, STEP_NUMBER);
    if LOAD_SAVED_DATA == false
        %%%% USER CHANGE %%%%%
        PLOT_FREQUENCY = 80; % This number will alter how long the programme runs for
        %%%%%%%%%%%%%%%%%%%%%%
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
        [planetMultiDArray(12,:), names(12), colors(12,:), type(12), parent(12)]= io();
        [planetMultiDArray(13,:), names(13), colors(13,:), type(13), parent(13)]= europa();
        [planetMultiDArray(14,:), names(14), colors(14,:), type(14), parent(14)]= ganymede();
        [planetMultiDArray(15,:), names(15), colors(15,:), type(15), parent(15)] = callisto();
        [planetMultiDArray(16,:), names(16), colors(16,:), type(16), parent(16)] = mimas();
        [planetMultiDArray(17,:), names(17), colors(17,:), type(17), parent(17)] = enceladus();
        [planetMultiDArray(18,:), names(18), colors(18,:), type(18), parent(18)] = tethys();
        [planetMultiDArray(19,:), names(19), colors(19,:), type(19), parent(19)] = dione();
        [planetMultiDArray(20,:), names(20), colors(20,:), type(20), parent(20)] = rhea();
        [planetMultiDArray(21,:), names(21), colors(21,:), type(21), parent(21)]= titan();
        [planetMultiDArray(22,:), names(22), colors(22,:), type(22), parent(22)]= lapetus();
        [planetMultiDArray(23,:), names(23), colors(23,:), type(23), parent(23)]= ariel();
        [planetMultiDArray(24,:), names(24), colors(24,:), type(24), parent(24)]= umbriel();
        [planetMultiDArray(25,:), names(25), colors(25,:), type(25), parent(25)]= titania();
        [planetMultiDArray(26,:), names(26), colors(26,:), type(26), parent(26)]= oberon();
        %Look for moons and make necessary adjustment
        for i = 1:length(type)
            if type(i) == "Moon"
                parentIndex = find(contains(names, parent(i)));
                planetMultiDArray(i,:) = moonCalc(planetMultiDArray(i,:), planetMultiDArray(parentIndex,:));
            end
        end
        %Calculate positions of every object at all times
        [planetRadiusArray, planetPositionArray, newTimeArray] = iterate(planetMultiDArray, times, PLOT_FREQUENCY);
        save('dataArrays.mat','planetRadiusArray','planetPositionArray','newTimeArray', 'names', 'colors', 'type', 'parent')
    else
        load('dataArrays.mat')
    end
    index = find(contains(names, TARGET));
    targetType = type(index);
    if names(index) ~= "Sun"
        parentIndex = find(contains(names, parent(index)));
    else
        parentIndex = 1;
    end
    if PLOT == true
        plotIt3D(planetRadiusArray, planetPositionArray, newTimeArray, names, colors, index, parentIndex, targetType, PLOT_RESIDUALS, SAVE_VIDEO, PLOT_PACE)
    end
end
