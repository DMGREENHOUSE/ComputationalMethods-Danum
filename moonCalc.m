function moonArr = moonCalc(moon, parent)
    r = parent(3:5);
    v = parent(6:8);
    pitchAngle = 5.14;
    r(2) = r(2) + moon(4)*cos(pitchAngle*pi/180);
    r(3) = r(3) + moon(4)*sin(pitchAngle*pi/180);
    v(1) = v(1) + moon(6);
    moonArr = [moon(1), moon(2), r, v, moon(9)];
end