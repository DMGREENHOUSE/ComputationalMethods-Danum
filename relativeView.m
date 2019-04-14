function [xRange, yRange, zRange]=relativeView(viewObjectR, type, diff)
    if type == "Sun"
        xConstant = 40;
        yConstant = 40;
        zConstant = 0.3;
    elseif type == "Planet"
        xConstant = 0.005*diff;
        yConstant = 0.005*diff;
        zConstant = 0.3;
    elseif type == "Moon"
        xConstant = 2*diff;
        yConstant = 2*diff;
        zConstant = 0.1;
    end
    xRange = [viewObjectR(1)-xConstant, viewObjectR(1)+xConstant];
    yRange = [viewObjectR(2)-yConstant, viewObjectR(2)+yConstant];
    zRange = [viewObjectR(3)-zConstant, viewObjectR(3)+zConstant];
end
