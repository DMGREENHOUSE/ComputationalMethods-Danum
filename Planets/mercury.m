function planet=mercury()
    mass = 3.3011*10^23
    radius = 2.4397e+6
    time=87.968
    distoSun = 57.9e+9
    planet=units(mass, radius, distoSun, time);
end