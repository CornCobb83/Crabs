function sharkGraphics = drawShark (xShark , yShark , thetaShark , sizeShark)

if (iscell(xShark))
  xShark = cell2mat(xShark);
endif
if (iscell(yShark))
  yShark = cell2mat(yShark);
endif
if (iscell(thetaShark))
  thetaShark = cell2mat(thetaShark);
endif

Shark = getShark(sizeShark);

R = getRotation(thetaShark);

SharkRotated = R * Shark;

T = getTranslation(xShark,yShark);
Shark = T * SharkRotated;

pt1=Shark( : , 1);
pt2=Shark( : , 2);
pt3=Shark( : , 3);
pt4=Shark( : , 4);
pt5=Shark( : , 5);
pt6=Shark( : , 6);
pt7=Shark( : , 7);
pt8=Shark( : , 8);
pt9=Shark( : , 9);
pt10=Shark( : , 10);
pt11=Shark( : , 11);
pt12=Shark( : , 12);
pt13=Shark( : , 13);
pt14=Shark( : , 14);
pt15=Shark( : , 15);
pt16=Shark( : , 16);
pt17=Shark( : , 17);
pt18=Shark( : , 18);
pt19=Shark( : , 19);
pt20=Shark( : , 20);
pt21=Shark( : , 21);
pt22=Shark( : , 22);
pt23=Shark( : , 23);
pt24=Shark( : , 24);

sharkGraphics(1) = drawLine(pt1 , pt2 , "k");
sharkGraphics(2) = drawLine(pt2 , pt3 , "k");
sharkGraphics(3) = drawLine(pt3 , pt4 , "k");
sharkGraphics(4) = drawLine(pt4 , pt5 , "k");

sharkGraphics(5) = drawLine(pt6 , pt5 , "k");
sharkGraphics(6) = drawLine(pt1 , pt7 , "k");
sharkGraphics(7) = drawLine(pt9 , pt8 , "k");
sharkGraphics(8) = drawLine(pt10 , pt9 , "k");
sharkGraphics(9) = drawLine(pt12 , pt11 , "k");
sharkGraphics(10) = drawLine(pt13 , pt14 , "k");
sharkGraphics(11) = drawLine(pt15 , pt16 , "k");
sharkGraphics(12) = drawLine(pt18 , pt17 , "k");
sharkGraphics(13) = drawLine(pt18 , pt19 , "k");

sharkGraphics(14) = drawLine(pt6 , pt20 , "k");
sharkGraphics(15) = drawLine(pt7 , pt21 , "k");

sharkGraphics(16) = drawLine(pt24 , pt20 , "k");
sharkGraphics(17) = drawLine(pt24 , pt23 , "k");
sharkGraphics(18) = drawLine(pt23 , pt22 , "k");
sharkGraphics(19) = drawLine(pt22 , pt21 , "k");


endfunction
