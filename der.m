function deriv=der(state,t, accel)
    %Unravel the state
    acceleration =[accel(1) accel(2) accel(3)];
    v=[state(4) state(5) state(6)];
    %Return the new values
    deriv=[v(1) v(2) v(3) acceleration(1) acceleration(2) acceleration(3)];
end
