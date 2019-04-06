function [io, NAME, COLOR, TYPE, PARENT] = io()
    % NAME - "Name" - name of the object with first letter capitalised
    % COLOR - [R, G, B]/255 - colour of the object in normalised RGB
    % TYPE - "Type - type of the object with first letter capitalised (Sun, Planet, Moon...)
    % PARENT - "Name" - name of the parent object that this object orbits with first letter capitalised
    % MASS - kg - mass of the object in kg
    % RADIUS - m -radius of the object in m
    % DIST_TO_PARENT - m - average distance to the object's parent in m
    % ORBIT_TIME - days - time for the object to orbit its parent in days
	NAME = "Io";
    COLOR = [255, 255, 255]/255;
    TYPE = "Moon";
    PARENT = "Jupiter";
    MASS = 8.94e+22;
    RADIUS = 1.815e+6;
    DIST_TO_PARENT = 4.216e+8;
    ORBIT_TIME = 1.7691;
    io = units(MASS, RADIUS, DIST_TO_PARENT, ORBIT_TIME);
end
