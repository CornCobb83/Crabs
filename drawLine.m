function handle = drawLine (p, q, color)

  x = [p(1); q(1)];

  y = [p(2); q(2)];

  handle = plot(x, y, color);

  set (handle, "LineWidth", 3);

endfunction
