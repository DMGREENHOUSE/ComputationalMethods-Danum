function planet=earth()
    mass = 5.9723*10^24;
    radius = 6.378137e+6;
    time=365.256;
    distoSun = 149.595*10^9;
    planet=units(mass, radius, distoSun, time);
end
