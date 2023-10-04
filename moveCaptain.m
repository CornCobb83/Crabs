function [xCapt, yCapt, thetaCapt] = moveCaptain (key, x, y, theta, dStep, height, width)

xCapt = x;
yCapt = y;
thetaCapt = theta;

dTheta = pi/6;

if (key == "w")
  tempxCapt = x + (cos(theta) * dStep);
  tempyCapt = y + (sin(theta) * dStep);

  if (tempxCapt > 0 && tempxCapt < width && tempyCapt > 0 && tempyCapt < height)

    xCapt += (cos(theta) * dStep);
    yCapt += (sin(theta) * dStep);
  else

    xCapt += 0;
    yCapt += 0;

  endif
endif

if (key == "a")
  thetaCapt = theta - dTheta;
endif

if (key == "s")
  tempxCapt = x - (cos(theta) * dStep);
  tempyCapt = y - (sin(theta) * dStep);

  if (tempxCapt > 0 && tempxCapt < width && tempyCapt > 0 && tempyCapt < height)

    xCapt -= (cos(theta) * dStep);
    yCapt -= (sin(theta) * dStep);
  else

    xCapt -= 0;
    yCapt -= 0;

  endif
endif

if (key == "d")
  thetaCapt = theta + dTheta;

endif

endfunction
