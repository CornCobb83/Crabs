function [xCrab, yCrab, dStep, thetaC, sc] = moveParaCrab (xCrab, yCrab, dStep, height, thetaC, sc)

if (iscell(xCrab))
  xCrab = cell2mat(xCrab);
endif
if (iscell(yCrab))
  yCrab = cell2mat(yCrab);
endif
if (iscell(dStep))
  dStep = cell2mat(dStep);
endif
if (iscell(sc))
  sc = cell2mat(sc);
endif

ytemp = yCrab + dStep;

%Upper boundary
if (ytemp < 100)
  yCrab += dStep;
  thetaC = (-pi/2);

  %Lower boudary, and ??? is placed at top at a random point
elseif (ytemp > 1300)
  yCrab = 20;
  xCrab = randi(1000) + 200;
  thetaC = (-pi/2);

else
  yCrab += dStep;
  temp = sin(sc);
  sc += pi/4;
  if (temp < 0)
    thetaC = (-pi/2);
    thetaC -= (pi/12);
  else
    thetaC = (-pi/2);
    thetaC += (pi/12);
  endif
  temp2 = xCrab + (temp * (dStep));

  if (temp2 > 50 && temp2 < 2000)
    xCrab = temp2;
  else
    xCrab += 0;
  endif

endif

endfunction
