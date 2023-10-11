function [xCrab, yCrab, thetaCrab, sizeCrab, dStep, calive, ovr] = newCrab ()

xCrab = randi(1000) + 200;
yCrab = randi(200) + 1000;

dStep = randi(20) + 30;

thetaCrab = -pi/2;
sizeCrab = 35;
var = randi(2);
if (var == 1)
  dStep = dStep;
else
  dStep = dStep * -1;
endif
calive = true;
%calive = false;
ovr = true;

endfunction
