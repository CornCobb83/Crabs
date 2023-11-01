function isAlive = alive (Cx, Cy, C1x, C1y, alive, ovr, dist)

ovr;
alive;

if (((abs(Cx - C1x) < dist && abs(Cy - C1y) < dist) && alive) || ovr == false)
  isAlive = false;
else
  isAlive = true;
endif

endfunction
