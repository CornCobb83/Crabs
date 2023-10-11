function [xCrab, yCrab, dStep] = moveCrab (x, y, dStep, width)

xCrab = x;
yCrab = y;

xtemp = x + dStep;

%Left side boundary
if (xtemp < 100)
  dStep *= (-1);
  xCrab += dStep;
  yCrab = randi(300) + 900;

  %right side boundary
elseif (xtemp > 1950)
  dStep *= (-1);
  xCrab += dStep;
  yCrab = randi(300) + 900;

else
  xCrab += dStep;

endif

endfunction
