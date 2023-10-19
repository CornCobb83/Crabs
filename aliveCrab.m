function isAlive = aliveCrab (Cx, Cy, thetaC, C1x, C1y, alive, ovr, xNet, yNet)

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
if (iscell(xNet))
  xNet = cell2mat(xNet);
endif
if (iscell(yNet))
  yNet = cell2mat(yNet);
endif

if (((abs(xNet - C1x) < 100 && abs(yNet - C1y) < 100) && alive) || ovr == false)
  isAlive = false;
else
  isAlive = true;
endif

endfunction
