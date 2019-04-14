function main()
    addpath('Planets');
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%% MAIN USER CHANGES %%%%%%%%%%%%%
    DATA = "total"; %accepts: calc, total, prev
    PLOT = true;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %%%%%%%%%%%% DATA CALC CHANGES %%%%%%%%%%%%%
    STEP_NUMBER = 8001; % This number will alter how long the programme runs for before plotting
    TOTAL_TIME = 2; % [years] This number will alter how long the programme runs for before plotting
    PLOT_FREQUENCY = 160; % This number will alter how long the programme runs for
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %%%%%%%%%%%%% PLOTTING CHANGES %%%%%%%%%%%%%
    PLOT_PACE = 0.001; % The refresh rate of the plot
    PLOT_TIME = 20; % [years]
    PLOT_POINT_FREQUENCY = 100;
    TARGET = "Sun"; % Which View? e.g. Earth
    TRACK = false; % Track the target planet?
    SAVE_VIDEO = false;
    PLOT_RESIDUALS = true;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    
    
    % If user does not specify to use the saved data, calculate it
    %     according to user specification:
    if DATA == "calc"
        % Generate a time array according to user specification
        times = timeArray(TOTAL_TIME, STEP_NUMBER);
        %Pre-define for speed
        planetMultiDArray = zeros(1, 9);
        colors = zeros(1, 3);
        % Will have form: 
        %     each row = planet
        %     across row (each column)[mass, radius, x, y, z, v_x, v_y, v_z, period]

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
        save('Data/dataArrays.mat','planetRadiusArray','planetPositionArray','newTimeArray', 'names', 'colors', 'type', 'parent', 'TOTAL_TIME')
    elseif DATA == "prev"
        load('Data/dataArrays.mat')  % Load the prewritten data file 'dataArrays.mat' in main folder
    elseif DATA == "total"
        load('Data/completeDataArrays.mat')  % Load the prewritten data file 'completeDataArrays.mat' in main folder
    end
    index = find(contains(names, TARGET));
    targetType = type(index);
    if names(index) ~= "Sun"
        parentIndex = find(contains(names, parent(index)));
    else % the Sun's parent does not have a written data set
        parentIndex = 1;
    end
    if PLOT == true
        PLOT_TIME_FRACTION = PLOT_TIME/TOTAL_TIME;
        plotIt3D(planetRadiusArray, planetPositionArray, newTimeArray, names, colors, index, parentIndex, targetType, PLOT_TIME_FRACTION, PLOT_POINT_FREQUENCY, PLOT_RESIDUALS, TRACK, SAVE_VIDEO, PLOT_PACE)
    end
end
