function deriv=der(state, otherPlanets)
    G=6.67*10^-11;
    %Unravel the state
    targetPlanetR=[state(1) state(2) state(3)];
    targetPlanetV=[state(4) state(5) state(6)];
    %Calc acceleration
    %Find all forces relative to the origin and sum them up
    accel = [0,0,0];
    for i=1:length(otherPlanets(:,1))
        otherPlanetMass = otherPlanets(i,1);
        otherPlanetR = otherPlanets(i,3:5);
        r = targetPlanetR - otherPlanetR;
        accel = accel-G*otherPlanetMass*r/norm(r)^3;
    end
    %Return the new values
    deriv=[targetPlanetV(1) targetPlanetV(2) targetPlanetV(3) accel(1) accel(2) accel(3)];
end
