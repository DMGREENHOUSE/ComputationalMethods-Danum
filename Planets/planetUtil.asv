calc(3.285*10^23, 88, 57.91*10^9)
function calc(massKG, orbitDays, distanceM)
    timePeriodS = orbitDays*24*60*60;
    %New Units
    SUN_MASS_NEW_UNITS = 1;
    EARTH_SUN_DISTANCE_NEW_UNITS = 1;
    EARTH_SUN_SPEED_NEW_UNITS = 2*pi;
    %Old Units
    SUN_MASS_KG = 1.989*10^30;
    EARTH_SUN_DISTANCE_M = 149.6*10^9;
    EARTH_SUN_SPEED_MS = EARTH_SUN_DISTANCE_M*2*pi/(365.25*24*60*60);
    
    velocityNewUnits = (distanceM*2*pi/timePeriodS)*EARTH_SUN_SPEED_NEW_UNITS/EARTH_SUN_SPEED_MS;
    massNewUnits = (massKG/SUN_MASS_KG)*SUN_MASS_NEW_UNITS;
    distanceNewUnits = (distanceM/EARTH_SUN_DISTANCE_M)*EARTH_SUN_DISTANCE_NEW_UNITS;
    disp("Velocity: "+velocityNewUnits)
    disp("Mass: "+massNewUnits)
    disp("Distance: "+distanceNewUnits)
end
