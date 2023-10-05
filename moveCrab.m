function [xCrab, yCrab, thetaCrab] = moveCrab (x, y, theta, dStep, height, width)

xCrab = x;
yCrab = y;
thetaCrab = theta;

dTheta = pi/6;

xtemp = xCrab + 300;
ytemp = yCrab + 0;

if (xtemp > 0 && xtemp < width && ytemp > 0 && ytemp < height)
  xCrab += 300;
  yCrab += 0;
else
  xCrab += 0;
  yCrab += 0;
endif

endfunction
