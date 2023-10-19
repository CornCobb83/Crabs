function paraCrabGraphics = drawParaCrab (xCrab , yCrab , thetaCrab , sizeCrab)

if (iscell(xCrab))
  xCrab = cell2mat(xCrab);
endif
if (iscell(yCrab))
  yCrab = cell2mat(yCrab);
endif
if (iscell(thetaCrab))
  thetaCrab = cell2mat(thetaCrab);
endif

Crab = getParaCrab(sizeCrab);

R = getRotation(thetaCrab);

CrabRotated = R * Crab;

T = getTranslation(xCrab,yCrab);
Crab = T * CrabRotated;

pt1=Crab( : , 1);
pt2=Crab( : , 2);
pt3=Crab( : , 3);
pt4=Crab( : , 4);
pt5=Crab( : , 5);
pt6=Crab( : , 6);
pt7=Crab( : , 7);
pt8=Crab( : , 8);
pt9=Crab( : , 9);
pt10=Crab( : , 10);
pt11=Crab( : , 11);
pt12=Crab( : , 12);
pt13=Crab( : , 13);
pt14=Crab( : , 14);
pt15=Crab( : , 15);
pt16=Crab( : , 16);
pt17=Crab( : , 17);

paraCrabGraphics(1) = drawLine(pt1 , pt2 , "r");
paraCrabGraphics(2) = drawLine(pt2 , pt3 , "r");
paraCrabGraphics(3) = drawLine(pt3 , pt4 , "r");
paraCrabGraphics(4) = drawLine(pt4 , pt1 , "r");
paraCrabGraphics(5) = drawLine(pt1 , pt5 , "r");
paraCrabGraphics(6) = drawLine(pt6 , pt7 , "r");
paraCrabGraphics(7) = drawLine(pt4 , pt8 , "r");
paraCrabGraphics(8) = drawLine(pt2 , pt9 , "r");
paraCrabGraphics(9) = drawLine(pt10 , pt11 , "r");
paraCrabGraphics(10) = drawLine(pt3 , pt12 , "r");

%parachute section:
paraCrabGraphics(11) = drawLine(pt13 , pt14 , "g");
paraCrabGraphics(12) = drawLine(pt14 , pt15 , "g");
paraCrabGraphics(13) = drawLine(pt15 , pt16 , "g");
paraCrabGraphics(14) = drawLine(pt16 , pt17 , "g");
paraCrabGraphics(15) = drawLine(pt17 , pt13 , "g");


endfunction
