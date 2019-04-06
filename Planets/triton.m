function [triton, NAME, COLOR, TYPE, PARENT] = triton()
    % NAME - "Name" - name of the object with first letter capitalised
    % COLOR - [R, G, B]/255 - colour of the object in normalised RGB
    % TYPE - "Type - type of the object with first letter capitalised (Sun, Planet, Moon...)
    % PARENT - "Name" - name of the parent object that this object orbits with first letter capitalised
    % MASS - kg - mass of the object in kg
    % RADIUS - m -radius of the object in m
    % DIST_TO_PARENT - m - average distance to the object's parent in m
    % ORBIT_TIME - days - time for the object to orbit its parent in days
	NAME = "Triton";
    COLOR = [255, 255, 255]/255;
    TYPE = "Moon";
    PARENT = "Neptune";
    MASS = 2.14e+22;
    RADIUS = 1.3534e+6;
    DIST_TO_PARENT = 3.54759e+8;
    ORBIT_TIME = 5.877;
    triton = units(MASS, RADIUS, DIST_TO_PARENT, ORBIT_TIME);
end