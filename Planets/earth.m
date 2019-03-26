function planet=earth()
%%%%REWRITE
% Would recommend writing all inside one class and each planet can be
% called from a function belonging to another class
%Should take in known parameters such as distance from sun, orbital period
%and then calculate the tangential velocity and distance in the new units
%(fractions of sun-earth)
%Should also be able to account for moons (make small deviations relative
%to orbiting body)
    mass = [5.972*10^24];
    radius = 6.371e+6;
    r = [149.6*10^9,0,0];
    v = [0,-29785.67831,0];
    planet=[mass, radius, r, v];
end