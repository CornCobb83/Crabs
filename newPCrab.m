function [xpCrab, ypCrab, thetapCrab, sizepCrab, dpStep, pCrabAlive, ovr] = newPCrab ()

xpCrab = randi(1800) + 200;
ypCrab = 0;

dpStep = randi(20) + 30;

thetapCrab = -pi/2;
sizepCrab = 40;
var = randi(2);
%if (var == 1)
%  dpStep = dpStep;
%else
%  dpStep = dpStep * -1;
%endif
pCrabAlive = true;
%calive = false;
ovr = true;

endfunction
