function fishGraphics = drawFish (xFish , yFish , thetaFish , sizeFish)

fish = getFish(sizeFish);

R = getRotation(thetaFish);

fishRotated = R * fish;

T = getTranslation(xFish,yFish);
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
