function moonArr = moonCalc(moon, parent)
    r = parent(3:5);
    v = parent(6:8);
    pitchAngle = 5.14;
    disp(r(1))
    disp(r(2))
    disp(r(3))
    disp(v(1));
    disp(v(2));
    disp(v(3));
    
    r(2) = r(2) + moon(4)*cos(pitchAngle*pi/180);
    r(3) = r(3) + moon(4)*sin(pitchAngle*pi/180);
    v(1) = v(1) + moon(6);
    disp(r(1))
    disp(r(2))
    disp(r(3))
    disp(v(1));
    disp(v(2));
    disp(v(3));
    moonArr = [moon(1), moon(2), r, v];
end