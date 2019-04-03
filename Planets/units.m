function output=units(mass, radius, r, T)
%input units; mass-Kgs, radius-metres, r-metres, Time-days)
AU=149.6*10^9;
newT=T/365.256;
newMass=mass/(1.989*10^30);
newRadius=radius/AU;
newR=[0, r/AU, 0];
iniV=2*pi*r/(AU*newT);
v=[-iniV,0,0];
output=[newMass, newRadius, newR, v, newT];
end
