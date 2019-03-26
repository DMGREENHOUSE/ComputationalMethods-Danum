function deriv=der(state, M)
    G=6.67*10^-11;
    %Unravel the state
    r=[state(1) state(2) state(3)];
    v=[state(4) state(5) state(6)];
    %Calc acceleration
    accel = G*M*r/norm(r)^3;
    %Return the new values
    deriv=[v(1) v(2) v(3) accel(1) accel(2) accel(3)];
end
