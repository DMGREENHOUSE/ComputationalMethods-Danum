function plotIt3D(planetRadiusArray, planetPosArray, times, names, colors, viewObjectIndex, viewObjectType, PLOT_FREQUENCY)
    PLANET_NUMBER = length(planetRadiusArray);
    %Set marker coefficient
    markerCoef = 100;
    markerPowerCoef = 0.35;
    markerSizeArray = (planetRadiusArray.^markerPowerCoef)*markerCoef;
    timeStepNumber = round(length(planetPosArray(:,1,1))/PLOT_FREQUENCY);
    for i=1:timeStepNumber
        j = PLOT_FREQUENCY*i;
        clf('reset');
        hold on
        currentTime = times(j)*365.256;
        currentYear = floor(currentTime/365.256);
        currentDay = mod(currentTime, 365.256);
        timePoint = planetPosArray(j,:,:);
        for n=1:PLANET_NUMBER
            x = timePoint(1, 1, n);
            y = timePoint(1, 2, n);
            z = timePoint(1, 3, n);
            markerSize = markerSizeArray(n);
            scatter3(x,y,z,markerSize,colors(n,:), 'filled')
            %possible to make a comet?
        end
        %Calc Relative View
        viewObjectR = timePoint(1, :, viewObjectIndex);
        [xRange, yRange, zRange] = relativeView(viewObjectR, viewObjectType);
        xlim([xRange(1) xRange(2)])
        ylim([yRange(1) yRange(2)])
        zlim([zRange(1) zRange(2)])
        set(gca,'Color','k')
        dim = [.3 .5 .1 .3];
        str = currentYear + " Years " + round(currentDay) + " Days";
        annotation('textbox',dim,'String',str,'FitBoxToText','on', 'Color','w');
        legend(names, 'Color','w')
        view(100,80)
        Frames(i) = getframe(gcf); % save frames
    end
    hold off
    vidObj = VideoWriter('planetMotion.avi');
    vidObj.Quality = 100;
    vidObj.FrameRate = 2;
    open(vidObj);
    writeVideo(vidObj, Frames);
    close(vidObj);
end

function [xRange, yRange, zRange]=relativeView(viewObjectR, type)
    if type == "Sun"
        xConstant = 40;
        yConstant = 40;
        zConstant = 40;
    elseif type == "Planet"
        xConstant = 5;
        yConstant = 5;
        zConstant = 5;
    elseif type == "Moon"
        xConstant = 0.1;
        yConstant = 0.1;
        zConstant = 0.1;
    end
    xRange = [viewObjectR(1)-xConstant, viewObjectR(1)+xConstant];
    yRange = [viewObjectR(2)-yConstant, viewObjectR(2)+yConstant];
    zRange = [viewObjectR(3)-zConstant, viewObjectR(3)+zConstant];
end