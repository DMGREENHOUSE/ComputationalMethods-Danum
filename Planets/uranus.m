function planet=uranus()
    mass = 8.6813e+25;
    radius = 2.5559e+7;
    time=30685.4;
    distoSun = 2.87247e+12;
    planet=units(mass, radius, distoSun, time);
end