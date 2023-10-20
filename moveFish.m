function [xFish, yFish, thetaFish] = moveFish(xFish, yFish, thetaFish, dStep, height, width)

if (iscell(xFish))
  xFish = cell2mat(xFish);
endif
if (iscell(yFish))
yFish = cell2mat(yFish);
endif
if (iscell(thetaFish))
thetaFish = cell2mat(thetaFish);
endif
if (iscell(dStep))
dStep = cell2mat(dStep);
endif

dthetaFish = -pi/2;

xFishtemp = xFish + (cos(thetaFish) * dStep);
yFishtemp = yFish + (sin(thetaFish) * dStep);

if (xFishtemp > 50 && xFishtemp < width - 50 && yFishtemp > 50 && yFishtemp < height - 50)
  xFish += (cos(thetaFish) * dStep);
  yFish += (sin(thetaFish) * dStep);

else
  thetaFish = thetaFish + dthetaFish;
  xFish += (cos(thetaFish) * dStep);
  yFish += (sin(thetaFish) * dStep);

endif

endfunction
