function [moon, NAME, COLOR, TYPE, PARENT] = moon()
    % NAME - "Name" - name of the object with first letter capitalised
    % COLOR - [R, G, B]/255 - colour of the object in normalised RGB
    % TYPE - "Type - type of the object with first letter capitalised (Sun, Planet, Moon...)
    % PARENT - "Name" - name of the parent object that this object orbits with first letter capitalised
    % MASS - kg - mass of the object in kg
    % RADIUS - m -radius of the object in m
    % DIST_TO_PARENT - m - average distance to the object's parent in m
    % ORBIT_TIME - days - time for the object to orbit its parent in days
	NAME = "Moon";
    COLOR = [255, 255, 255]/255;
    TYPE = "Moon";
    PARENT = "Earth";
    MASS = 7.346e+22;
    RADIUS = 1.7381e+6;
    DIST_TO_PARENT = 3.844e+8;
    ORBIT_TIME = 27.3217;
    moon = units(MASS, RADIUS, DIST_TO_PARENT, ORBIT_TIME);
end
