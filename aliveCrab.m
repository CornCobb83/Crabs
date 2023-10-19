function isAlive = aliveCrab (Cx, Cy, thetaC, C1x, C1y, alive, ovr, net)

if (iscell(C1x))
  C1x = cell2mat(C1x);
endif
if (iscell(C1y))
  C1y = cell2mat(C1y);
endif
if (iscell(ovr))
  ovr = cell2mat(ovr);
endif
if (iscell(alive))
  alive = cell2mat(alive);
endif

if (((abs(net(1, : ) - C1x) < 100 && abs(net(2, : ) - C1y) < 100) && alive) || ovr == false)
  isAlive = false;
else
  isAlive = true;
endif

endfunction
