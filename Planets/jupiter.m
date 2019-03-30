function planet=jupiter()
    mass = 1.89819e+27;
    radius = 7.1492e+7;
    time=4332.589;
    distoSun = 7.7857e+11;
    planet=units(mass, radius, distoSun, time);
end