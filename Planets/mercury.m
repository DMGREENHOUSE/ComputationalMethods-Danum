function [planet, NAME, COLOR, TYPE, PARENT] = mercury()
    % NAME - "Name" - name of the object with first letter capitalised
    % COLOR - [R, G, B]/255 - colour of the object in normalised RGB
    % TYPE - "Type - type of the object with first letter capitalised (Sun, Planet, Moon...)
    % PARENT - "Name" - name of the parent object that this object orbits with first letter capitalised
    % MASS - kg - mass of the object in kg
    % RADIUS - m -radius of the object in m
    % DIST_TO_PARENT - m - average distance to the object's parent in m
    % ORBIT_TIME - days - time for the object to orbit its parent in days
    NAME = "Mercury";
    COLOR = [196, 196, 196]/255;
    TYPE = "Planet";
    PARENT = "Sun";
    MASS = 3.3011*10^23;
    RADIUS = 2.4397e+6;
    ORBIT_TIME = 87.968;
    DIST_TO_SUN = 57.9e+9;
    planet=units(MASS, RADIUS, DIST_TO_SUN, ORBIT_TIME);
end