function [xCapt, yCapt, thetaCapt] = moveCaptain (key, x, y, theta)

xCapt = x;
yCapt = y;
thetaCapt = theta;

dTheta = pi/6;

if (key == "w")
  xCapt += (cos(theta) * 50);
  yCapt += (sin(theta) * 50);
endif

if (key == "a")
  %yCapt = y - 10;
  thetaCapt = theta - dTheta;
endif

if (key == "s")
  xCapt -= (cos(theta) * 50);
  yCapt -= (sin(theta) * 50);
endif

if (key == "d")
  %yCapt = y + 10;
  thetaCapt = theta + dTheta;

endif

endfunction
