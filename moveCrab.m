function [xCrab, dStep] = moveCrab (x, dStep, width)

xCrab = x;

xtemp = x + dStep;

%Left side boundary
if (xtemp < 100)
  dStep *= (-1);
  xCrab += dStep;

  %right side boundary
elseif (xtemp > 1950)
  dStep *= (-1);
  xCrab += dStep;

else
  xCrab += dStep;

endif

endfunction
