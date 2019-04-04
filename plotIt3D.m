function plotIt3D(planetRadiusArray, planetPosArray, times, names, colors, viewObjectIndex, viewObjectType, PLOT_RESIDUALS, SAVE_VIDEO)
    PLANET_NUMBER = length(planetRadiusArray);
    %Set marker coefficient
    markerCoef = 100;
    markerPowerCoef = 0.4;
    markerSizeArray = (planetRadiusArray.^markerPowerCoef)*markerCoef;
    timeStepNumber = round(length(planetPosArray(:,1,1)));
    set(gcf, 'Position', get(0, 'Screensize')); %Make figure open in fullscreen
    dim = [.3 .5 .1 .3]; % Year-Day info box dimensions/position
    
    
    RESIDUAL_NUMBER = 10;
    residualArray = zeros(RESIDUAL_NUMBER,3,PLANET_NUMBER);
    count = 0;
    for i=1:timeStepNumber
        clf('reset');
        hold on
        currentTime = times(i)*365.256;
        currentYear = floor(currentTime/365.256);
        currentDay = round(mod(currentTime, 365.256));
        timePoint = planetPosArray(i,:,:);
        for n=1:PLANET_NUMBER
            x = timePoint(1, 1, n);
            y = timePoint(1, 2, n);
            z = timePoint(1, 3, n);
            markerSize = markerSizeArray(n);
            scatter3(x,y,z,markerSize,colors(n,:), 'filled')
        end
        if PLOT_RESIDUALS == true
            count = count+1;
            residualArray(count,:,:) = timePoint;
            if count >= RESIDUAL_NUMBER
                count = 0;
            end
            for j = 1:RESIDUAL_NUMBER
                residualPoint = residualArray(j,:,:);
                for k = 1:PLANET_NUMBER
                    x = residualPoint(1, 1, k);
                    y = residualPoint(1, 2, k);
                    z = residualPoint(1, 3, k);
                    % Don't plot those at the origin!
                    if round(x,5) ~= 0 && round(y,5) ~= 0
                        scatter3(x,y,z,0.1,colors(k,:))
                    end
                end
            end
        end
        %Calc Relative View
        viewObjectR = timePoint(1, :, viewObjectIndex);
        [xRange, yRange, zRange] = relativeView(viewObjectR, viewObjectType);
        xlim([xRange(1) xRange(2)])
        ylim([yRange(1) yRange(2)])
        zlim([zRange(1) zRange(2)])
        set(gca,'Color','k')
        str = currentYear + " Years " + currentDay + " Days";
        annotation('textbox',dim,'String',str,'FitBoxToText','on', 'Color','w');
        legend(names, 'Color','w')
        view(100, 80)
        if SAVE_VIDEO == true
            Frames(i) = getframe(gcf); % save frames
        else 
            pause(0.1)
        end
    end
    hold off
    if SAVE_VIDEO == true
        vidObj = VideoWriter('planetMotion.avi');
        vidObj.Quality = 100;
        vidObj.FrameRate = 1;
        open(vidObj);
        writeVideo(vidObj, Frames);
        close(vidObj);
    end
end