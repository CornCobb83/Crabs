function isAlive = alive (Cx, Cy, C1x, C1y, alive, ovr)

if (((abs(Cx - C1x) < 150 && abs(Cy - C1y) < 150) && alive) || ovr == false)
  isAlive = false;
else
  isAlive = true;
endif

endfunction
