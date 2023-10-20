function [xCrab, yCrab, dStep] = moveCrab (xCrab, yCrab, dStep, width)

if (iscell(xCrab))
  xCrab = cell2mat(xCrab);
endif
if (iscell(yCrab))
  yCrab = cell2mat(yCrab);
endif
if (iscell(dStep))
  dStep = cell2mat(dStep);
endif

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
