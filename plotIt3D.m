function plotIt3D(planetRadiusArray, planetPosArray, times, names, colors, viewObjectIndex, viewObjectParentIndex, viewObjectType, PLOT_TIME_FRACTION, PLOT_RESIDUALS, TRACK, SAVE_VIDEO, PLOT_PACE)
    PLANET_NUMBER = length(planetRadiusArray);
    TIME_STEP_NUMBER = round(length(times)*PLOT_TIME_FRACTION); % The number of time steps (data positions)
    
    % Calculate the initial difference between a target viewing object and
    % its parent. This is used for the relative view (axis scaling)
    viewObjectR = planetPosArray(1, :, viewObjectIndex);
    viewObjectParentR = planetPosArray(1, :, viewObjectParentIndex);
    diff = viewObjectParentR - viewObjectR;
    absDiff = sqrt((diff(1)^2 + diff(2)^2));
    
    %Set marker coefficient
    MARKER_COEF = 2000;
    MARKER_POWER = 0.4;
    RESIDUAL_MARKER_COEF = 0.05;
    markerSizeArray = (planetRadiusArray.^MARKER_POWER)*MARKER_COEF;
    
    set(gcf, 'Position', get(0, 'Screensize')); %Make figure open in fullscreen
    dim = [.3 .5 .1 .3]; % Year-Day info box dimensions/position

    if PLOT_RESIDUALS == true
        RESIDUAL_NUMBER = 2000;
        residualArray = zeros(RESIDUAL_NUMBER,3,PLANET_NUMBER);
        count = 0;
        len = PLANET_NUMBER*RESIDUAL_NUMBER;
        % place all the initial values off screen
        xs = 45*ones(1, len);
        ys = 45*ones(1, len);
        zs = 45*ones(1, len);
        % copy the marker size and color information for every residual point
        newMarkerSizeArray = markerSizeArray;
        newColors = colors;
        for i = 2 : RESIDUAL_NUMBER
            newMarkerSizeArray = [newMarkerSizeArray; markerSizeArray*RESIDUAL_MARKER_COEF];
            newColors = [newColors; colors];
        end
        markerSizeArray = newMarkerSizeArray;
        colors = newColors;
    elseif PLOT_RESIDUALS == false
        % Set an initial plot to be immediately updated
        xs = zeros(1, PLANET_NUMBER);
        ys = zeros(1, PLANET_NUMBER);
        zs = zeros(1, PLANET_NUMBER);
    end
    % make an initial scatter plot, to be updated:
    h = scatter3(xs,ys,zs, markerSizeArray, colors, 'filled');
    set(gca,'Color','k'); % set background colour to black
    view(100, 80) % set initial view
    [xRange, yRange, zRange] = relativeView(viewObjectR, viewObjectType, absDiff);
    xlim([xRange(1) xRange(2)])
    ylim([yRange(1) yRange(2)])
    zlim([zRange(1) zRange(2)])
    
    % show a list of all the Suns, Planets, Moons:
    for i = 1 : PLANET_NUMBER
        yPos = .85-.032*i;
        annotation('textbox',[0.15 yPos .1 .1],'String',names(i), 'BackgroundColor',colors(i,:))
    end
    
    % show the current time in years and days
    str = "0 Years " + "0 Days"; % Initial value, to be updated
    label = annotation('textbox',dim,'String',str,'FitBoxToText','on', 'Color','w');
    
    % begin looking at each time point
    for i=1:TIME_STEP_NUMBER
        % Update the current displayed time
        currentTime = times(i)*365.256;
        currentYear = floor(currentTime/365.256);
        currentDay = round(mod(currentTime, 365.256));
        str = currentYear + " Years " + currentDay + " Days";
        set(label, 'String', str)
        
        timePoint = planetPosArray(i,:,:);
        if PLOT_RESIDUALS == false
            set(h, 'xData', timePoint(1, 1, :), 'yData', timePoint(1, 2, :), 'zData', timePoint(1, 3, :))
        else
            count = count+1;
            residualArray(count,:,:) = timePoint;
            if count >= RESIDUAL_NUMBER
                count = 0;
            end
            % in xs, ys, zs the first 'set' (full set of planets) should be the leader, and
            % subsequent 'sets' should be the residuals
            % NOTE: this leaves a gap in the residual trail, but it is left
            % because it aids the visual
            xs(1 : PLANET_NUMBER) = timePoint(1, 1, :);
            ys(1 : PLANET_NUMBER) = timePoint(1, 2, :);
            zs(1 : PLANET_NUMBER) = timePoint(1, 3, :);
            for j = 2 : RESIDUAL_NUMBER
                residualPoint = residualArray(j,:,:);
                startPosInArr = (j - 1)*PLANET_NUMBER + 1;
                endPosInArr = j*PLANET_NUMBER;
                xs(startPosInArr : endPosInArr) = residualPoint(1, 1, :);
                ys(startPosInArr : endPosInArr) = residualPoint(1, 2, :);
                zs(startPosInArr : endPosInArr) = residualPoint(1, 3, :);
            end
            set(h, 'xData', xs, 'yData', ys, 'zData', zs)
        end
        if TRACK == true
            % Find the optimum view for this current time point, and viewed object
            viewObjectR = timePoint(1, :, viewObjectIndex);
            [xRange, yRange, zRange] = relativeView(viewObjectR, viewObjectType, absDiff);
            xlim([xRange(1) xRange(2)])
            ylim([yRange(1) yRange(2)])
            zlim([zRange(1) zRange(2)])
        end
        if SAVE_VIDEO == true
            Frames(i) = getframe(gcf); % save frames 
        end
        pause(PLOT_PACE); % pause the plot before looking at the next time point
        drawnow;
    end
    
    % If the user specifies to save the video, do so
    if SAVE_VIDEO == true
        vidObj = VideoWriter('planetMotion.avi');
        vidObj.Quality = 100;
        vidObj.FrameRate = 1;
        open(vidObj);
        writeVideo(vidObj, Frames);
        close(vidObj);
    end
end