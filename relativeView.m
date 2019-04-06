function [xRange, yRange, zRange, max]=relativeView(viewObjectR, type, diff, max)
    if type == "Sun"
        xConstant = 40;
        yConstant = 40;
        zConstant = 40;
    elseif type == "Planet"
        xConstant = 5*abs(diff);
        yConstant = 5*abs(diff);
        zConstant = 5;
    elseif type == "Moon"
        xConstant = 2*abs(diff);
        yConstant = 2*abs(diff);
        zConstant = 0.1;
    end
    if xConstant > max(1)
        disp("Xconstant:" + xConstant)
        disp("X: old:" + max(1))
        max(1) = xConstant;
        disp("X: new:" + max(1))
    end
    if yConstant > max(2)
        disp("Yconstant:" + yConstant)
        disp("Y: old:" + max(2))
        max(2) = xConstant;
        disp("Y: new:" + max(2))
    end
    if zConstant > max(3)
        disp("Zconstant:" + zConstant)
        disp("Z: old:" + max(3))
        max(3) = xConstant;
        disp("Z: new:" + max(3))
    end
    xRange = [viewObjectR(1)-max(1), viewObjectR(1)+max(1)];
    yRange = [viewObjectR(2)-max(2), viewObjectR(2)+max(2)];
    zRange = [viewObjectR(3)-max(3), viewObjectR(3)+max(3)];
end
