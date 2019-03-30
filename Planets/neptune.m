function planet=neptune()
    mass = 1.02413e+26;
    radius = 2.4764e+7;
    time=60189;
    distoSun = 4.49506e+12;
    planet=units(mass, radius, distoSun, time);
end