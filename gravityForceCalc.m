function gravityAccCalc(m1, r)
    G=1;
    coef=G*m1;
    forceX=coef/r(1)^2;
    forceY=coef/r(2)^2;
    forceZ=coef/r(3)^2; 
    force = [forceX, forceY, forceZ];
return force