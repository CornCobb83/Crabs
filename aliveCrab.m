function isAlive = aliveCrab (Cx, Cy, thetaC, C1x, C1y, alive, ovr, net)


if (((abs(net(1, : ) - C1x) < 100 && abs(net(2, : ) - C1y) < 100) && alive) || ovr == false)
  isAlive = false;
else
  isAlive = true;
endif

endfunction
