function [xCrab, yCrab, thetaCrab, sizeCrab, dStep, calive] = newCrab (poss)

if (poss == 1)
  xCrab = randi(1000) + 200;
  yCrab = 150;
endif
if (poss == 2)
  xCrab = 300;
  yCrab = randi(1000) + 200;
endif
if (poss == 3)
  xCrab = 1800;
  yCrab = randi(1000) + 200;
endif

thetaCrab = pi/randi(9);
sizeCrab = 35;
dStep = 50;
calive = true;
%calive = false;

endfunction
