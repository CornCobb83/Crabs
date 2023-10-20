function [xFish, yFish, thetaFish, sizeFish, dStep, calive, ovr] = newShark (poss, step)

%1 = top, 2 = left, 3 = right

if (mod(poss, 3) == 0)
  xFish = randi(1000) + 200;
  yFish = 150;

elseif (mod(poss, 2) == 0)
  xFish = 300;
  yFish = randi(1000) + 200;
else
  xFish = 1800;
  yFish = randi(1000) + 200;
endif

thetaFish = pi/randi(9);
if (thetaFish == pi/2 || thetaFish == 0 || thetaFish == pi/1)
  thetaFish += pi/9;
endif

sizeFish = 100;
dStep = step;
calive = true;
%calive = false;
ovr = true;

endfunction
