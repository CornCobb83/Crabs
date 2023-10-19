function fishGraphics = drawFish (xFish , yFish , thetaFish , sizeFish)

if (iscell(xFish))
  xFish = cell2mat(xFish);
endif
if (iscell(yFish))
yFish = cell2mat(yFish);
endif
if (iscell(thetaFish))
thetaFish = cell2mat(thetaFish);
endif

fish = getFish(sizeFish);

R = [cos(thetaFish) -sin(thetaFish) 0; sin(thetaFish) cos(thetaFish) 0; 0 0 1];

fishRotated = R * fish;

T = [1 0 xFish; 0 1 yFish; 0 0 1];
fish = T * fishRotated;

pt1=fish( : , 1);
pt2=fish( : , 2);
pt3=fish( : , 3);
pt4=fish( : , 4);
pt5=fish( : , 5);
pt6=fish( : , 6);
pt7=fish( : , 7);
pt8=fish( : , 8);


fishGraphics(1) = drawLine(pt1 , pt2 , "b");
fishGraphics(2) = drawLine(pt2 , pt3 , "b");
fishGraphics(3) = drawLine(pt3 , pt4 , "b");
fishGraphics(4) = drawLine(pt4 , pt5 , "b");
fishGraphics(5) = drawLine(pt5 , pt6 , "b");
fishGraphics(6) = drawLine(pt6 , pt1 , "b");
fishGraphics(7) = drawLine(pt4 , pt7 , "b");
fishGraphics(8) = drawLine(pt7 , pt8 , "b");
fishGraphics(9) = drawLine(pt8 , pt4 , "b");

endfunction
