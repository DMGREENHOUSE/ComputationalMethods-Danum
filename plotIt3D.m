function plotIt3D(planetMultiDArray, times, viewObjectIndex, viewObjectType)
    %colours for markers
    markers = [[255 0 0]; [196, 196, 196]; [153, 0, 153]; [0, 128, 255];...
        [204, 102, 0]; [255, 153, 51]; [255, 255, 51]; [0, 204, 204];...
        [0, 0, 204]; [224, 224, 224]; [255, 255, 255]]/255;
    %TODO: REWRITE by adding field to planetMultiDArray?
    objects = ["sun", "mercury", "venus", "earth", "mars", "jupiter", "saturn", "uranus", "neptune", "pluto"];
    PLANET_NUMBER = length(planetMultiDArray(1,1,:));
    %Set marker coefficient
    markerCoef = 100;
    markerPowerCoef = 0.35;
    markerSizeArray = zeros(PLANET_NUMBER);
    instance = planetMultiDArray(1,:,:);
    for i=1:PLANET_NUMBER
        markerSizeArray(i) = (instance(1, 2, i)^markerPowerCoef)*markerCoef;
    end
    timeStepNumber = length(planetMultiDArray(:,1,1)) - 1;
    %AS much calculation as possible should be done outside of this
    %plotting loop
    %Split up large arrays outside this scope?
    for i=1:timeStepNumber
        clf('reset');
        hold on
        currentTime = times(i)*365.256;
        currentYear = floor(currentTime/365.256);
        currentDay = mod(currentTime, 365.256);
        timePoint = planetMultiDArray(i,:,:);
        for n=1:PLANET_NUMBER
            x = timePoint(1, 3, n);
            y = timePoint(1, 4, n);
            z = timePoint(1, 5, n);
            markerColour = markers(n,:);
            markerSize = markerSizeArray(n);
            scatter3(x,y,z,markerSize,markerColour, 'filled')
            %possible to make a comet?
        end
        %Calc Relative View
        viewObjectR = timePoint(1, 3:5, viewObjectIndex);
        [xRange, yRange, zRange] = relativeView(viewObjectR, viewObjectType);
        xlim([xRange(1) xRange(2)])
        ylim([yRange(1) yRange(2)])
        zlim([zRange(1) zRange(2)])
        set(gca,'Color','k')
        dim = [.3 .5 .1 .3];
        str = currentYear + " Years" + round(currentDay) + " Days";
        annotation('textbox',dim,'String',str,'FitBoxToText','on', 'Color','w');
        legend(objects, 'Color','w')
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
    if type == "solar system"
        xConstant = 40;
        yConstant = 40;
        zConstant = 40;
    elseif type == "sun"
        xConstant = 20;
        yConstant = 20;
        zConstant = 20;
    elseif type == "planet"
        xConstant = 5;
        yConstant = 5;
        zConstant = 5;
    elseif type == "moon"
        xConstant = 1;
        yConstant = 1;
        zConstant = 1;
    end
    xRange = [viewObjectR(1)-xConstant, viewObjectR(1)+xConstant];
    yRange = [viewObjectR(2)-yConstant, viewObjectR(2)+yConstant];
    zRange = [viewObjectR(3)-zConstant, viewObjectR(3)+zConstant];
end