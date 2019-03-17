function main()
    times = timeArray();
    singlePlanetArray = zeros(length(times),7);
    planetMultiDArray = singlePlanetArray;
    planetNumber=3;
    for n=1:planetNumber
       planetMultiDArray(:,:,n) = singlePlanetArray; 
    end
    %%CHECK the total size of planetMultiDArray, is it adding extra?
    %%Assign initial values
    planetMultiDArray(1,:,1) = [100, 0,0,0,0,0,0];
    planetMultiDArray(1,:,2) = [1, 1,1,1,2,2,2];
    planetMultiDArray(1,:,3) = [42, 3,3,3,4,4,4];
    disp(planetMultiDArray);
    for i=1:length(times)
        for j=1:planetNumber
        	%Function call returning new x, new y...;
            targetPlanet = planetMultiDArray(i,:,j);
            acceleration = [0,0,0];
            for k=1:planetNumber
                if k~=j
                    %enter to force calc
                    r1=targetPlanet(2)-planetMultiDArray(i,2,k);
                    r2=targetPlanet(3)-planetMultiDArray(i,3,k);
                    r3=targetPlanet(4)-planetMultiDArray(i,4,k);
                    r=[r1,r2,r3];
                    accFromKthPlanet = gravityAccCalc(planetMultiDArray(i,1,k), r);
                    acceleration = acceleration + accFromKthPlanet;
                end
            end
            %acceleration
            velocity = [targetPlanet(5), targetPlanet(6), targetPlanet(7)];
            disp(acceleration);
            %next planet line has updated values
            derivState = [velocity(1), velocity(2), velocity(3), acceleration(1),...
                acceleration(2), acceleration(3)];
            currentState=targetPlanet(2:7);
            newState=rk4(currentState,t,tau,derivState,1);%1 is GM
            planetMultiDArray(i+1,:,j) = [100, 0,0,0,0,0,0];
        end
    end
end

function times=timeArray()
    startTime = 0;
    endTime = 0;
    timeStep = 1;
    times = linspace(startTime, endTime, 1+(endTime-startTime)/timeStep);
end

function accel=gravityAccCalc(M, r)
    G=1;
    coef= -G*M;
    accel = coef*r/norm(r)^3;
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
end; 
