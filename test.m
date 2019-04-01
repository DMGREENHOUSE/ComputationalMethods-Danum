function Kepler()
%* Set initial position and velocity of the comet.
r0 = 1; %initial radial distance (AU)
v0 = pi; %initial tangential velocity (AU/yr)
r = [r0 0]; v = [0 v0];
state = [ r(1) r(2) v(1) v(2) ]; % Used by R-K routines
%* Set physical parameters (mass, G*M)
GM = 4*pi^2; % Grav. const. * Mass of Sun (au^3/yr^2)
%* Loop over desired number of steps using specified
nStep = 2000; %number of steps
tau = 0.001; %time step (yr)
time = 0;
for iStep=1:nStep
state = rk4(state,time,tau,@gravrk,GM);
r = [state(1) state(2)]; % 4th order Runge-Kutta
v = [state(3) state(4)];
time = time + tau;
xpos(iStep)=r(1);
ypos(iStep)=r(2);
clf('reset');
hold on;
axis off
axis equal
plot(r(1),r(2),'bo','MarkerFaceColor','g')
plot(0,0,'o','MarkerFaceColor','r','MarkerSize',20)
text(0.1,0,'Sun');
plot(xpos,ypos);
pause(0.1)
axis([-0.2 1.1 -0.4 0.4]);
end
function xout = rk4(x,t,tau,derivsRK,param)
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
F0 = feval(derivsRK,x,t,param);
t_half = t + half_tau;
xtemp = x + half_tau*F0;
F1 = feval(derivsRK,xtemp,t_half,param);
xtemp = x + half_tau*F1;
F2 = feval(derivsRK,xtemp,t_half,param);
t_full = t + tau;
xtemp = x + tau*F2;
F3 = feval(derivsRK,xtemp,t_full,param);
xout = x + tau/6.*(F0 + F3 + 2.*(F1+F2));
return;
function deriv = gravrk(s,t,GM)
% Returns right-hand side of Kepler ODE; used by Runge-Kutta
% Inputs
% s State vector [r(1) r(2) v(1) v(2)]
% t Time (not used)
% GM Parameter G*M (gravitational const. * solar mass)
% Output
% deriv Derivatives [dr(1)/dt dr(2)/dt dv(1)/dt dv(2)/dt]
r = [s(1) s(2)]; %Unravel the vector s into position and velocity
v = [s(3) s(4)];
accel = -GM*r/norm(r)^3; % Gravitational acceleration
deriv = [v(1) v(2) accel(1) accel(2)];
return;