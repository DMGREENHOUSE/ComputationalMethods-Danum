function [planet, NAME, COLOR, TYPE, PARENT] = pluto()
    % NAME - "Name" - name of the object with first letter capitalised
    % COLOR - [R, G, B]/255 - colour of the object in normalised RGB
    % TYPE - "Type - type of the object with first letter capitalised (Sun, Planet, Moon...)
    % PARENT - "Name" - name of the parent object that this object orbits with first letter capitalised
    % MASS - kg - mass of the object in kg
    % RADIUS - m -radius of the object in m
    % DIST_TO_PARENT - m - average distance to the object's parent in m
    % ORBIT_TIME - days - time for the object to orbit its parent in days
    NAME = "Pluto";
    COLOR = [224, 224, 224]/255;
    TYPE = "Planet";
    PARENT = "Sun";
    MASS = 1.303e+22;
    RADIUS = 1.187e+6;
    ORBIT_TIME = 90560;
    DIST_TO_SUN = 5.906375e+12;
    planet=units(MASS, RADIUS, DIST_TO_SUN, ORBIT_TIME);
end