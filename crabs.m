function crabs ()
counter = 0;
[mapHeight , mapWidth] = drawMap( "BGImage.png", counter );

xCapt = 1000;
yCapt = 500;
thetaCapt = -pi/2;
sizeCapt = 50;
dStep = 50;

%1 = top, 2 = left, 3 = right
poss = 1;
[xCrab1, yCrab1, thetaCrab1, sizeCrab1, dStep1, c1alive] = newCrab(poss);
poss = 2;
[xCrab2, yCrab2, thetaCrab2, sizeCrab2, dStep2, c2alive] = newCrab(poss);
poss = 3;
[xCrab3, yCrab3, thetaCrab3, sizeCrab3, dStep3, c3alive] = newCrab(poss);

captainGraphics = drawCapt (xCapt, yCapt, thetaCapt, sizeCapt);
crab1Graphics = drawCrab(xCrab1, yCrab1, thetaCrab1, sizeCrab1);
crab2Graphics = drawCrab(xCrab2, yCrab2, thetaCrab2, sizeCrab2);
crab3Graphics = drawCrab(xCrab3, yCrab3, thetaCrab3, sizeCrab3);

cmd = "null";

while (cmd != "Q" )

%while (c1alive || c2alive || c3alive)
[xCrab1, yCrab1, thetaCrab1, crab1Graphics, c1alive] = runCrab(xCapt,yCapt,xCrab1,yCrab1,c1alive,crab1Graphics,thetaCrab1,dStep1,mapHeight,mapWidth,sizeCrab1);

[xCrab2, yCrab2, thetaCrab2, crab2Graphics, c2alive] = runCrab(xCapt,yCapt,xCrab2,yCrab2,c2alive,crab2Graphics,thetaCrab2,dStep2,mapHeight,mapWidth,sizeCrab2);

[xCrab3, yCrab3, thetaCrab3, crab3Graphics, c3alive] = runCrab(xCapt,yCapt,xCrab3,yCrab3,c3alive,crab3Graphics,thetaCrab3,dStep3,mapHeight,mapWidth,sizeCrab3);

    cmd = kbhit();
    counter += 1;
    if (cmd == "w" || cmd == "a" || cmd == "s" || cmd == "d")

      for (i = 1 : length(captainGraphics))
        set(captainGraphics(i), 'Visible', "off");
      endfor

      %move captain
      [xCapt, yCapt, thetaCapt] = moveCaptain(cmd, xCapt, yCapt, thetaCapt, dStep, mapHeight, mapWidth);

      %draw new captain
      captainGraphics = drawCapt(xCapt, yCapt, thetaCapt, sizeCapt);

  endif

if (c1alive || c2alive || c3alive)
  counter
  title(counter);
endif

%endwhile

%close all

endwhile

close all

endfunction

