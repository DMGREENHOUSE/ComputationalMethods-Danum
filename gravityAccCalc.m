function accel=gravityAccCalc(M, r)
    G=4*pi^2;
    coef= -G*M;
    accel = coef*r/norm(r)^3;
end
