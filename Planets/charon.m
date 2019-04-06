function [charon, NAME, COLOR, TYPE, PARENT] = charon()
    % NAME - "Name" - name of the object with first letter capitalised
    % COLOR - [R, G, B]/255 - colour of the object in normalised RGB
    % TYPE - "Type - type of the object with first letter capitalised (Sun, Planet, Moon...)
    % PARENT - "Name" - name of the parent object that this object orbits with first letter capitalised
    % MASS - kg - mass of the object in kg
    % RADIUS - m -radius of the object in m
    % DIST_TO_PARENT - m - average distance to the object's parent in m
    % ORBIT_TIME - days - time for the object to orbit its parent in days
	NAME = "Charon";
    COLOR = [255, 255, 255]/255;
    TYPE = "Moon";
    PARENT = "Pluto";
    MASS = 1.52e+21;
    RADIUS = 6.035e+5;
    DIST_TO_PARENT = 1.7536e+4;
    ORBIT_TIME = 6.387;
    charon = units(MASS, RADIUS, DIST_TO_PARENT, ORBIT_TIME);
end