function plotIt(planetMultiDArray)
    %colours for markers
    %TODO specify color based on size??
    markers = ["ro", "bo","go","ko", "ro", "bo", "go","ko","ro", "bo",...
        "go","ko", "ro", "bo", "go","ko"];
    PLANET_NUMBER = length(planetMultiDArray(1,1,:))
    %Set marker coefficient
    markerCoef = 1/(2*6.9551e1);%km
    markerPowerCoef = 0.35;
    for i=1:length(planetMultiDArray(:,1,1))
        clf('reset');
        hold on
        timePoint = planetMultiDArray(i,:,:);
        for n=1:PLANET_NUMBER
            x = timePoint(1, 3, n);
            y = timePoint(1, 4, n);
            z = timePoint(1, 5, n);
            marker = markers(n);
            markerSize = (timePoint(1, 2, n)^markerPowerCoef)*markerCoef;
            plot(x, y, marker, 'MarkerSize', markerSize)
        end
        xlim([-10^12 10^12])
        ylim([-10^12 10^12])
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
