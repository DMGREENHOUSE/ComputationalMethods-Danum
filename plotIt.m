function plotIt(planetMultiDArray)
    for i=1:length(planetMultiDArray(:,1,1))
        clf('reset');
        hold on
        timePoint = planetMultiDArray(i,:,:);
        %Set marker coefficient
        markerCoef = 500/695510;%km
        plot(timePoint(1, 2, 1), timePoint(1, 3, 1), 'ro', 'MarkerSize',695510*markerCoef/25)%Sun is not to scale
        plot(timePoint(1, 2, 2), timePoint(1, 3, 2), 'bo', 'MarkerSize',6371*markerCoef)
        %plot(timePoint(1, 2, 3), timePoint(1, 3, 3), 'go', 'MarkerSize',1737*markerCoef*3)
        %plot(timePoint(1, 2, 4), timePoint(1, 3, 4), 'ko', 'MarkerSize',2440*markerCoef)
        xlim([-10^12 10^12])
        ylim([-10^12 10^12])
        %pause(0.001)
        Frames(i) = getframe; % save frames
    end
    hold off
    vidObj = VideoWriter('planetMotion.avi');
    vidObj.Quality = 90;
    vidObj.FrameRate = 6;
    open(vidObj);
    writeVideo(vidObj, Frames);
    close(vidObj);
end
