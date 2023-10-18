function [xpCrab, ypCrab, thetapCrab, sizepCrab, dpStep, pCrabAlive, ovr, sc] = newPCrab ()

xpCrab = randi(1800) + 200;
ypCrab = 0;
sc = 0;

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
%pCrabAlive = false;
rand = randi(3);

if (rand == 1)
  sc = 0;
elseif (rand == 2)
  sc = (3*pi)/4;
else
  sc = (5*pi)/4;
endif

ovr = true;

endfunction
