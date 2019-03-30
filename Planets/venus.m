function planet=venus()
%%%%REWRITE
    mass = 4.8675*10^24;
    radius = 6.0518e+6;
    time=224.701;
    distoSun =108.2*e+9;
    planet=units(mass, radius, distoSun, time)
end