function xout=rk4(x,tau,derivsRK, param)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % PLEASE NOTE: This method was written by Professor Lim as part of the
    % PC3236 Lecture Series and full credit should go to him.
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Runge-Kutta integrator (4th order)
    % Input arguments -
    % x = current value of dependent variable
    % t = independent variable (usually time)
    % tau = step size (usually timestep)
    % derivsRK = right hand side of the ODE; derivsRK is the
    % name of the function which returns dx/dt
    % Calling format derivsRK(x,t,param).
    % param = extra parameters passed to derivsRK
    % Output arguments -
    % xout = new value of x after a step of size tau
    half_tau = 0.5*tau;
    F0 = feval(derivsRK,x,param);
    xtemp = x + half_tau*F0;
    F1 = feval(derivsRK,xtemp,param);
    xtemp = x + half_tau*F1;
    F2 = feval(derivsRK,xtemp,param);
    xtemp = x + tau*F2;
    F3 = feval(derivsRK,xtemp,param);
    xout =  tau/6.*(F0 + F3 + 2.*(F1+F2));
return;
