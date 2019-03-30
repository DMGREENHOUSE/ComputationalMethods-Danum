function plotIt3D(planetMultiDArray, times)
    %colours for markers
    %TODO specify color based on size??
    markers = ["ro", "bo","go","ko", "ro", "bo", "go","ko","ro", "bo",...
        "go","ko", "ro", "bo", "go","ko"];
    PLANET_NUMBER = length(planetMultiDArray(1,1,:))
    %Set marker coefficient
    markerCoef = 100;
    markerPowerCoef = 0.35;
    for i=1:length(planetMultiDArray(:,1,1))
        clf('reset');
        hold on
        currentTime = times(i);
        currentYear = floor(currentTime/365.256);
        currentDay = mod(currentTime, 365.256);
        timePoint = planetMultiDArray(i,:,:);
        for n=1:PLANET_NUMBER
            x = timePoint(1, 3, n);
            y = timePoint(1, 4, n);
            z = timePoint(1, 5, n);
            markerColour = markers(n);
            markerSize = (timePoint(1, 2, n)^markerPowerCoef)*markerCoef;
            disp("MS: " + markerSize)
            disp("x: " + x)
            scatter3(x,y,z,markerSize,markerColour, 'filled')
        end
        xlim([-40 40])
        ylim([-40 40])
        zlim([-40 40])
        legend(currentYear + "Years" + round(currentDay) + "Days");
        view(100,80)
        
        Frames(i) = getframe; % save frames
    end
    hold off
    vidObj = VideoWriter('planetMotion.avi');
    vidObj.Quality = 100;
    vidObj.FrameRate = 2;
    open(vidObj);
    writeVideo(vidObj, Frames);
    close(vidObj);
end
