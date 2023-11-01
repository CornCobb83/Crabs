function [xCrab, yCrab, dStep] = moveCrab (xCrab, yCrab, dStep, width)

xCrabtemp = xCrab + dStep;

%Left side boundaryCrab
if (xCrabtemp < 100)
  dStep *= (-1);
  xCrab += dStep;
  yCrab = randi(200) + 1000;

  %right side boundaryCrab
elseif (xCrabtemp > 1950)
  dStep *= (-1);
  xCrab += dStep;
  yCrab = randi(200) + 1000;

else
  xCrab += dStep;

endif

endfunction
