function [xpCrab, ypCrab, dpStep, thetaC, sc] = moveParaCrab (xp, yp, dpStep, height, theta, sc)

xpCrab = xp;
ypCrab = yp;
thetaC = theta;

yptemp = yp + dpStep;

%Upper boundary
if (yptemp < 100)
  ypCrab += dpStep;
  thetaC = (-pi/2);

  %Lower boudary, and ??? is placed at top at a random point
elseif (yptemp > 1300)
  ypCrab = 20;
  xpCrab = randi(1000) + 200;
  thetaC = (-pi/2);

else
  ypCrab += dpStep;
  temp = sin(sc);
  sc += pi/4;
  if (temp < 0)
    thetaC = (-pi/2);
    thetaC -= (pi/12);
  else
    thetaC = (-pi/2);
    thetaC += (pi/12);
  endif
  temp2 = xpCrab + (temp * (dpStep));

  if (temp2 > 50 && temp2 < 2000)
    xpCrab = temp2;
  else
    xpCrab += 0;
  endif

endif

endfunction
