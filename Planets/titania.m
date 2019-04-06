function [titania, NAME, COLOR, TYPE, PARENT] = titania()
    % NAME - "Name" - name of the object with first letter capitalised
    % COLOR - [R, G, B]/255 - colour of the object in normalised RGB
    % TYPE - "Type - type of the object with first letter capitalised (Sun, Planet, Moon...)
    % PARENT - "Name" - name of the parent object that this object orbits with first letter capitalised
    % MASS - kg - mass of the object in kg
    % RADIUS - m -radius of the object in m
    % DIST_TO_PARENT - m - average distance to the object's parent in m
    % ORBIT_TIME - days - time for the object to orbit its parent in days
	NAME = "Titania";
    COLOR = [255, 255, 255]/255;
    TYPE = "Moon";
    PARENT = "Uranus";
    MASS = 3.5e+21;
    RADIUS = 7.889e+5;
    DIST_TO_PARENT = 4.363e+8;
    ORBIT_TIME = 8.706;
    titania = units(MASS, RADIUS, DIST_TO_PARENT, ORBIT_TIME);
end