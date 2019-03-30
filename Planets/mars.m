function planet=mars()
    mass = 0.64171e+24;
    radius = 3.3962e+6;
    time=686.98;
    distoSun = 2.27925e+11;
    planet=units(mass, radius, distoSun, time);
end