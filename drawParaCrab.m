function paraCrabGraphics = drawParaCrab (xpCrab , ypCrab , thetapCrab , sizepCrab)

pCrab = getParaCrab(sizepCrab);

R = getRotation(thetapCrab);

pCrabRotated = R * pCrab;

T = getTranslation(xpCrab,ypCrab);
pCrab = T * pCrabRotated;

pt1=pCrab( : , 1);
pt2=pCrab( : , 2);
pt3=pCrab( : , 3);
pt4=pCrab( : , 4);
pt5=pCrab( : , 5);
pt6=pCrab( : , 6);
pt7=pCrab( : , 7);
pt8=pCrab( : , 8);
pt9=pCrab( : , 9);
pt10=pCrab( : , 10);
pt11=pCrab( : , 11);
pt12=pCrab( : , 12);
pt13=pCrab( : , 13);
pt14=pCrab( : , 14);
pt15=pCrab( : , 15);
pt16=pCrab( : , 16);
pt17=pCrab( : , 17);

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
