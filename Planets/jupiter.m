function [planet, NAME, COLOR, TYPE, PARENT] = jupiter()
    % NAME - "Name" - name of the object with first letter capitalised
    % COLOR - [R, G, B]/255 - colour of the object in normalised RGB
    % TYPE - "Type - type of the object with first letter capitalised (Sun, Planet, Moon...)
    % PARENT - "Name" - name of the parent object that this object orbits with first letter capitalised
    % MASS - kg - mass of the object in kg
    % RADIUS - m -radius of the object in m
    % DIST_TO_PARENT - m - average distance to the object's parent in m
    % ORBIT_TIME - days - time for the object to orbit its parent in days
    NAME = "Jupiter";
    COLOR = [255, 153, 51]/255;
    TYPE = "Planet";
    PARENT = "Sun";
    MASS = 1.89819e+27;
    RADIUS = 7.1492e+7;
    ORBIT_TIME = 4332.589;
    DIST_TO_SUN = 7.7857e+11;
    planet=units(MASS, RADIUS, DIST_TO_SUN, ORBIT_TIME);
end