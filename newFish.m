function [xFish, yFish, thetaFish, sizeFish, dStep, calive, ovr] = newFish (poss)

if (poss == 1)
  xFish = randi(1000) + 200;
  yFish = 150;
endif
if (poss == 2)
  xFish = 300;
  yFish = randi(1000) + 200;
endif
if (poss == 3)
  xFish = 1800;
  yFish = randi(1000) + 200;
endif

thetaFish = pi/randi(9);
if (thetaFish == pi/2 || thetaFish == 0 || thetaFish == pi/1)
  thetaFish += pi/9;
endif
sizeFish = 50;
dStep = 30;
calive = true;
%calive = false;
ovr = true;

endfunction
