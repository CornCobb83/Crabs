function [xCrab, yCrab, thetaCrab] = moveCrab (x, y, theta, dStep, height, width)

xCrab = x;
yCrab = y;
thetaCrab = theta;

dTheta = -pi/2;

xtemp = x + (cos(theta) * dStep);
ytemp = y + (sin(theta) * dStep);

if (xtemp > 0 && xtemp < width && ytemp > 0 && ytemp < height - 50)
xCrab += (cos(theta) * dStep);
yCrab += (sin(theta) * dStep);
%xCrab += 100;
%yCrab += 100;
else
thetaCrab = theta + dTheta;
xCrab += (cos(thetaCrab) * dStep);
yCrab += (sin(thetaCrab) * dStep);
endif

endfunction
