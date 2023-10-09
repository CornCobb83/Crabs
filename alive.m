function isAlive = alive (Cx, Cy, C1x, C1y, alive)

if ((abs(Cx - C1x) < 200 && abs(Cy - C1y) < 200) && alive)
  isAlive = false;
else
  isAlive = true;
endif

endfunction
