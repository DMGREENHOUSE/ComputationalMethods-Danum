function [planet, NAME, COLOR, TYPE, PARENT] = uranus()
    % NAME - "Name" - name of the object with first letter capitalised
    % COLOR - [R, G, B]/255 - colour of the object in normalised RGB
    % TYPE - "Type - type of the object with first letter capitalised (Sun, Planet, Moon...)
    % PARENT - "Name" - name of the parent object that this object orbits with first letter capitalised
    % MASS - kg - mass of the object in kg
    % RADIUS - m -radius of the object in m
    % DIST_TO_PARENT - m - average distance to the object's parent in m
    % ORBIT_TIME - days - time for the object to orbit its parent in days
    NAME = "Uranus";
    COLOR = [0, 204, 204]/255;
    TYPE = "Planet";
    PARENT = "Sun";
    MASS = 8.6813e+25;
    RADIUS = 2.5559e+7;
    TIME = 30685.4;
    DIST_TO_SUN = 2.87247e+12;
    planet = units(MASS, RADIUS, DIST_TO_SUN, TIME);
end