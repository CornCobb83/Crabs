function [xFish, yFish, thetaFish] = moveFish (x, y, theta, dStep, height, width)

xFish = x;
yFish = y;
thetaFish = theta;

dTheta = -pi/2;

xtemp = x + (cos(theta) * dStep);
ytemp = y + (sin(theta) * dStep);

if (xtemp > 50 && xtemp < width - 50 && ytemp > 50 && ytemp < height - 50)
  xFish += (cos(theta) * dStep);
  yFish += (sin(theta) * dStep);

else
  thetaFish = theta + dTheta;
  xFish += (cos(thetaFish) * dStep);
  yFish += (sin(thetaFish) * dStep);
endif

endfunction
