function [planet, NAME, COLOR, TYPE, PARENT] = venus()
    % NAME - "Name" - name of the object with first letter capitalised
    % COLOR - [R, G, B]/255 - colour of the object in normalised RGB
    % TYPE - "Type - type of the object with first letter capitalised (Sun, Planet, Moon...)
    % PARENT - "Name" - name of the parent object that this object orbits with first letter capitalised
    % MASS - kg - mass of the object in kg
    % RADIUS - m -radius of the object in m
    % DIST_TO_PARENT - m - average distance to the object's parent in m
    % ORBIT_TIME - days - time for the object to orbit its parent in days
	NAME = "Venus";
    COLOR = [153, 0, 153]/255;
    TYPE = "Planet";
    PARENT = "Sun";
    MASS = 4.8675*10^24;
    RADIUS = 6.0518e+6;
    ORBIT_TIME = 224.701;
    DIST_TO_SUN = 108.2e+9;
    planet=units(MASS, RADIUS, DIST_TO_SUN, ORBIT_TIME);
end