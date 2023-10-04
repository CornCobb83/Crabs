function crab1Graphics = drawCrab1 (xCrab1 , yCrab1 , thetaCrab1 , sizeCrab1)

crab1 = getCrab1(sizeCrab1);

R = getRotation(thetaCrab1);

crab1Rotated = R * crab1;

T = getTranslation(xCrab1,yCrab1);
crab1 = T * crab1Rotated;

pt1=crab1( : , 1);
pt2=crab1( : , 2);
pt3=crab1( : , 3);
pt4=crab1( : , 4);
pt5=crab1( : , 5);
pt6=crab1( : , 6);
pt7=crab1( : , 7);
pt8=crab1( : , 8);
pt9=crab1( : , 9);
pt10=crab1( : , 10);

crab1Graphics(1) = drawLine(pt1 , pt2 , "r");
crab1Graphics(2) = drawLine(pt2 , pt3 , "r");
crab1Graphics(3) = drawLine(pt2 , pt5 , "r");
crab1Graphics(4) = drawLine(pt4 , pt5 , "r");
crab1Graphics(5) = drawLine(pt5 , pt6 , "r");
crab1Graphics(6) = drawLine(pt6 , pt1 , "r");
crab1Graphics(7) = drawLine(pt7 , pt8 , "r");
crab1Graphics(8) = drawLine(pt8 , pt9 , "r");
crab1Graphics(9) = drawLine(pt9 , pt10 , "r");

endfunction

