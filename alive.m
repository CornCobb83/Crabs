function isAlive = alive (Cx, Cy, C1x, C1y, alive, ovr, dist)

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

ovr;
alive;

if (((abs(Cx - C1x) < dist && abs(Cy - C1y) < dist) && alive) || ovr == false)
  isAlive = false;
else
  isAlive = true;
endif

endfunction
