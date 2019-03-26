function Kepler() %*Setinitialpositionandvelocityofthecomet.
r0=1;%initialradialdistance(AU) 
v0=pi;%initialtangentialvelocity(AU/yr) 
r=[r0 0 0];
v=[0 v0 0]; 
state=[r(1) r(2) r(3) v(1) v(2) v(3)];%UsedbyR-Kroutines
%*Setphysicalparameters(mass,G*M) 
GM=4*pi^2;%Grav.const.*MassofSun(au^3/yr^2) %*Loopoverdesirednumberofstepsusingspecified 
nStep=2000;%numberofsteps 
tau=0.001;%timestep(yr) 
time=0; 
for iStep=1:nStep
    state=rk4(state, time, tau, @gravrk, GM);
    r=[state(1) state(2) stat(3)];%4thorderRunge-Kutta 
    v=[state(4) state(5) state(6)]; 
    time=time+tau;
        xpos(iStep)=r(1);
    ypos(iStep)=r(2);
    clf('reset');
    hold on;
    axis off 
    axis equal 
    plot(r(1), r(2), 'bo', 'MarkerFaceColor', 'g')
    plot(0, 0, 'o', 'MarkerFaceColor', 'r', 'MarkerSize', 20)
    text(0.1, 0, 'Sun'); 
    plot(xpos, ypos); 
    pause(0.1) 
    axis([-0.2 1.1 -0.4 0.4]);
end 
function xout=rk4(x,t,tau,derivsRK,param) 
%Runge-Kuttaintegrator(4thorder) 
%Inputarguments%x=currentvalueofdependentvariable
%t=independentvariable(usuallytime) 
%tau=stepsize(usuallytimestep)
%derivsRK=righthandsideoftheODE;derivsRKisthe 
%nameofthefunctionwhichreturnsdx/dt
%CallingformatderivsRK(x,t,param).
%param=extraparameterspassedtoderivsRK 
%Outputarguments
%xout=newvalueofxafterastepofsizetau
half_tau=0.5*tau; 
F0=feval(derivsRK,x,t,param);
t_half=t+half_tau; 
xtemp=x+half_tau*F0; 
F1=feval(derivsRK,xtemp,t_half,param);
xtemp=x+half_tau*F1; 
F2=feval(derivsRK,xtemp,t_half,param);
t_full=t+tau;
xtemp=x+tau*F2;
F3=feval(derivsRK,xtemp,t_full,param); 
xout=x+tau/6.*(F0+F3+2.*(F1+F2)); 
return; 

function deriv=gravrk(s, t, GM)
%Returnsright-handsideofKeplerODE;usedbyRunge-Kutta
%Inputs
%sStatevector[r(1)r(2)v(1)v(2)]
%tTime(notused)
%GMParameterG*M(gravitationalconst.*solarmass) 
%Output 
%derivDerivatives[dr(1)/dtdr(2)/dtdv(1)/dtdv(2)/dt] 
r=[s(1) s(2) s(3)];
%Unravelthevectorsintopositionandvelocity 
v=[s(4) s(5) s(6)];
accel=-GM*r/norm(r)^3;
%Gravitationalacceleration
deriv=[v(1) v(2) v(3) accel(1) accel(2) accel(3)];
return 
