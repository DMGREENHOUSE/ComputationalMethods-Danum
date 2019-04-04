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
