<<<<<<< HEAD
function deriv=der(state, M)
=======
function deriv=der(state, otherPlanets)
>>>>>>> 675c51cd347b49c178053db360dd32533a808042
    G=6.67*10^-11;
    %Unravel the state
    targetPlanetR=[state(1) state(2) state(3)];
    targetPlanetV=[state(4) state(5) state(6)];
    %Calc acceleration
<<<<<<< HEAD
    accel = G*M*r/norm(r)^3;
=======
    %Find all forces relative to the origin and sum them up
    accel = [0,0,0];
    for i=1:length(otherPlanets(:,1))
        otherPlanetMass = otherPlanets(i,1);
        otherPlanetR = otherPlanets(i,3:5);
        r = targetPlanetR - otherPlanetR;
        accel = accel-G*otherPlanetMass*r/norm(r)^3;
    end
>>>>>>> 675c51cd347b49c178053db360dd32533a808042
    %Return the new values
    deriv=[targetPlanetV(1) targetPlanetV(2) targetPlanetV(3) accel(1) accel(2) accel(3)];
end
