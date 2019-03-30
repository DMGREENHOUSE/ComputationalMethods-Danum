function planet=pluto()
    mass = 1.303e+22;
    radius = 1.187e+6;
    time=90560;
    distoSun = 5.906375e+12;
    planet=units(mass, radius, distoSun, time)
end