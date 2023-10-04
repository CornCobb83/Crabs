function crabs ()
% Crabs is a kids computer game where a fisherman, called the captain,
% hunts for a very clever and powerful crab.
% Draw the game map and initialize map dimensions.
[mapHeight , mapWidth] = drawMap( "BGImage.png" );
% Initialize captain location, heading and size
%This

xCapt = 1000;
yCapt = 500;
thetaCapt = -pi/2;
sizeCapt = 50;
dStep = 50;
%Changing xCapt and yCapt change the captains location

xCrab1 = 500;
yCrab1 = 300;
thetaCrab1 = -pi/2;
sizeCrab1 = 35;

xCrab2 = 1800;
yCrab2 = 800;
thetaCrab2 = -pi/2;
sizeCrab2 = 35;

xCrab3 = 300;
yCrab3 = 1000;
thetaCrab3 = -pi/2;
sizeCrab3 = 35;

% Draw the captain and initialize graphics handles
%*********************************************************
% Put your call to drawCapt() here ..... You must give drawCapt its
% input and output arguments.
captainGraphics = drawCapt (xCapt, yCapt, thetaCapt, sizeCapt);
crab1Graphics = drawCrab1(xCrab1, yCrab1, thetaCrab1, sizeCrab1);
crab2Graphics = drawCrab1(xCrab2, yCrab2, thetaCrab2, sizeCrab2);
crab3Graphics = drawCrab1(xCrab3, yCrab3, thetaCrab3, sizeCrab3);
%*******************************************************



cmd = "null";

while (cmd != "Q")

  %performTaskEverySecond(xCrab1, yCrab1, thetaCrab1);
  %moveCrab(xCrab1, yCrab1, thetaCrab1);

  cmd = kbhit();

    [xCrab1, yCapt1, thetaCapt1] = moveCrab(xCrab1, yCrab1, thetaCrab1);

    if (cmd == "w" || cmd == "a" || cmd == "s" || cmd == "d")

      %remove old captain
      for (i = 1 : length(captainGraphics))
        set(captainGraphics(i), 'Visible', "off");
      endfor

      %move captain
      [xCapt, yCapt, thetaCapt] = moveCaptain(cmd, xCapt, yCapt, thetaCapt, dStep, mapHeight, mapWidth);

      %draw new captain
      captainGraphics = drawCapt(xCapt, yCapt, thetaCapt, sizeCapt);

endif

endwhile

close all

endfunction

