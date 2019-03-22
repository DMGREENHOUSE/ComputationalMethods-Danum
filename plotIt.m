function plotIt(planetMultiDArray)
    for i=1:length(planetMultiDArray(:,1,1))
        clf('reset');
        plot(0,0, 'ro')
        hold on
        timePoint = planetMultiDArray(i,:,:);
        for j=1:length(timePoint(1,1,:))
            plot(timePoint(1, 2, j), timePoint(1, 3, j), 'bo')
            xlim([-2 2])
            ylim([-2 2])
        end
        pause(0.1)
    end
    hold off
end
