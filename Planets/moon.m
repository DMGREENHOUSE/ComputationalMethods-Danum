function planet=moon()
%%%%REWRITE
    mass = 7.346e+22;
    radius = 1.7381e+6;
    distoParent = 3.844e+5;
    time = 27.3217;
    planet=units(mass, radius, distoParent, time);
end