function moonArr = moonCalc(moon, parent)
    r = moon(3:5)+parent(3:5);
    v = moon(6:8)+parent(6:8);
    moonArr = [moon(1), moon(2), r, v];
end