function [planet, NAME, COLOR, TYPE, PARENT] = sun()
    % NAME - "Name" - name of the object with first letter capitalised
    % COLOR - [R, G, B]/255 - colour of the object in normalised RGB
    % TYPE - "Type - type of the object with first letter capitalised (Sun, Planet, Moon...)
    % PARENT - "Name" - name of the parent object that this object orbits with first letter capitalised
    % MASS - M_S - mass of the object in units of the mass of the sun
    % RADIUS - AU -radius of the object in AU
    % DIST_TO_PARENT - AU - average distance to the object's parent in AU
    % ORBIT_TIME - years - time for the object to orbit its parent in years
    NAME = "Sun";
    COLOR = [255 0 0]/255;
    TYPE = "Sun";
    PARENT = "Milky Way";
    AU=149.6*10^9;
    MASS = 1;
    RADIUS = 6.9551e+8/AU;
    ORBIT_TIME = 0;
    r = [0,0,0];
    v = [0,0,0];
    planet=[MASS, RADIUS r, v, ORBIT_TIME];
end
