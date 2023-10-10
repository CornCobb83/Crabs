function [xpCrab, ypCrab, dpStep] = moveParaCrab (xpCrab, yp, dpStep, height)

ypCrab = yp;

yptemp = yp + dpStep;

%Upper boundary
if (yptemp < 100)
  ypCrab += dpStep;

  %Lower boudary, and ??? is placed at top at a random point
elseif (yptemp > 1300)
  ypCrab = 20;
  xpCrab = randi(1000) + 200;

else
  ypCrab += dpStep;

endif

endfunction
