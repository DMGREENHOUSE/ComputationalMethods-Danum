function planet=saturn()
    mass = 5.6834e+26;
    radius = 6.0268e+7;
    time=10759.22;
    distoSun = 1.433525e+12;
    planet=units(mass, radius, distoSun, time)
end