function [xCrab, dStep] = moveCrab (x, dStep, width)

xCrab = x;

xtemp = x + dStep;

if (xtemp < 100)
  dStep *= (-1);
  xCrab += dStep;

elseif (xtemp > 1950)
  dStep *= (-1);
  xCrab += dStep;

else
  xCrab += dStep;

endif

endfunction
