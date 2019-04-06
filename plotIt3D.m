function plotIt3D(planetRadiusArray, planetPosArray, times, names, colors, viewObjectIndex, viewObjectParentIndex, viewObjectType, PLOT_RESIDUALS, SAVE_VIDEO, PLOT_PACE)
    PLANET_NUMBER = length(planetRadiusArray);
    %Set marker coefficient
    markerCoef = 100;
    markerPowerCoef = 0.4;
    markerSizeArray = (planetRadiusArray.^markerPowerCoef)*markerCoef;
    timeStepNumber = round(length(planetPosArray(:,1,1)));
    set(gcf, 'Position', get(0, 'Screensize')); %Make figure open in fullscreen
    dim = [.3 .5 .1 .3]; % Year-Day info box dimensions/position
    max = [0, 0, 0];

    if PLOT_RESIDUALS == true
        RESIDUAL_NUMBER = 10;
        residualArray = zeros(RESIDUAL_NUMBER,3,PLANET_NUMBER);
        count = 0;
        len = PLANET_NUMBER*RESIDUAL_NUMBER;
        xs = zeros(1, len);
        ys = zeros(1, len);
        zs = zeros(1, len);
    elseif PLOT_RESIDUALS == false
        % Set an initial plot to be immediately updated
        xs = zeros(1, PLANET_NUMBER);
        ys = zeros(1, PLANET_NUMBER);
        zs = zeros(1, PLANET_NUMBER);
    end
    h = scatter3(xs,ys,zs, markerSizeArray, colors, 'filled');
    for i = 1: PLANET_NUMBER
        yPos = .85-.032*i;
        annotation('textbox',[0.15 yPos .1 .1],'String',names(i), 'BackgroundColor',colors(i,:))
    end
    str = "0 Years " + "0 Days";
    label = annotation('textbox',dim,'String',str,'FitBoxToText','on', 'Color','w');
    for i=1:timeStepNumber
        currentTime = times(i)*365.256;
        currentYear = floor(currentTime/365.256);
        currentDay = round(mod(currentTime, 365.256));
        timePoint = planetPosArray(i,:,:);
        set(h, 'xData', timePoint(1, 1, :), 'yData', timePoint(1, 2, :), 'zData', timePoint(1, 3, :))
        
        if PLOT_RESIDUALS == true
            count = count+1;
            residualArray(count,:,:) = timePoint;
            if count >= RESIDUAL_NUMBER
                count = 0;
            end
            for j = 1:RESIDUAL_NUMBER
                residualPoint = residualArray(j,:,:);
                
                x = residualPoint(1, 1, :);
                y = residualPoint(1, 2, :);
                z = residualPoint(1, 3, :);
                % Don't plot those at the origin!
                if round(x,5) ~= 0 && round(y,5) ~= 0
                    set(h, 'xData', timePoint(1, 1, :), 'yData', timePoint(1, 2, :), 'zData', timePoint(1, 3, :))
                end
            end
        end
        %Calc Relative View
        viewObjectR = timePoint(1, :, viewObjectIndex);
        viewObjectParentR = timePoint(1, :, viewObjectParentIndex);
        diff = abs(viewObjectParentR - viewObjectR)
        if diff(1) > diff(2)
            maxDiff = diff(1);
        else
            maxDiff = diff(2);
        end
        [xRange, yRange, zRange, max] = relativeView(viewObjectR, viewObjectType, maxDiff, max);
        xlim([xRange(1) xRange(2)])
        ylim([yRange(1) yRange(2)])
        zlim([zRange(1) zRange(2)])
        set(gca,'Color','k')
        str = currentYear + " Years " + currentDay + " Days";
        set(label, 'String', str)
        view(100, 80)
        if SAVE_VIDEO == true
            Frames(i) = getframe(gcf); % save frames
        else 
            pause(PLOT_PACE)
        end
        drawnow;
    end
    if SAVE_VIDEO == true
        vidObj = VideoWriter('planetMotion.avi');
        vidObj.Quality = 100;
        vidObj.FrameRate = 1;
        open(vidObj);
        writeVideo(vidObj, Frames);
        close(vidObj);
    end
end