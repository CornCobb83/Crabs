function alive = alive1 (Cx, Cy, C1x, C1y)

if ((Cx - C1x) < 100 && (Cy - C1y) < 100)
  alive = false;
else
  alive = true;
endif

endfunction
