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

xCrab1 = 1000;
yCrab1 = 500;
thetaCrab1 = -pi/2;
sizeCrab1 = 30;

% Draw the captain and initialize graphics handles
%*********************************************************
% Put your call to drawCapt() here ..... You must give drawCapt its
% input and output arguments.
captainGraphics = drawCapt (xCapt, yCapt, thetaCapt, sizeCapt);
crab1Graphics = drawCrab1(xCrab1, yCrab1, thetaCrab1, sizeCrab1);
%*******************************************************

cmd = "null";

while (cmd != "Q")

  cmd = kbhit();

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

