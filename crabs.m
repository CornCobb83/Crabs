function crabs ()
[mapHeight , mapWidth] = drawMap( "BGImage.png" );

xCapt = 1000;
yCapt = 500;
thetaCapt = -pi/2;
sizeCapt = 50;
dStep = 50;

xCrab1 = 500;
yCrab1 = 300;
thetaCrab1 = -pi/2;
sizeCrab1 = 35;
dStep1 = 50;

xCrab2 = 1800;
yCrab2 = 800;
thetaCrab2 = -pi/2;
sizeCrab2 = 35;
dStep2 = 50;

xCrab3 = 300;
yCrab3 = 1000;
thetaCrab3 = -pi/2;
sizeCrab3 = 35;
dStep3 = 50;

captainGraphics = drawCapt (xCapt, yCapt, thetaCapt, sizeCapt);
crab1Graphics = drawCrab(xCrab1, yCrab1, thetaCrab1, sizeCrab1);
crab2Graphics = drawCrab(xCrab2, yCrab2, thetaCrab2, sizeCrab2);
crab3Graphics = drawCrab(xCrab3, yCrab3, thetaCrab3, sizeCrab3);
cmd = "null";

while (cmd != "Q")

    % crab1
    for (i = 1 : length(crab1Graphics))
       set(crab1Graphics(i), 'Visible', "off");
    endfor

    %move crab
    [xCrab1, yCapt1, thetaCrab1] = moveCrab(xCrab1, yCrab1, thetaCrab1, dStep1, mapHeight, mapWidth);

    %draw new crab
    crab1Graphics = drawCrab(xCrab1, yCrab1, thetaCrab1, sizeCrab1);

    % crab2
    for (i = 1 : length(crab2Graphics))
       set(crab2Graphics(i), 'Visible', "off");
    endfor

    %move crab
    [xCrab2, yCapt2, thetaCrab2] = moveCrab(xCrab2, yCrab2, thetaCrab2, dStep2, mapHeight, mapWidth);

    %draw new crab
    crab2Graphics = drawCrab(xCrab2, yCrab2, thetaCrab2, sizeCrab2);

    % crab3
    for (i = 1 : length(crab3Graphics))
       set(crab3Graphics(i), 'Visible', "off");
    endfor

    %move crab
    [xCrab3, yCapt3, thetaCrab3] = moveCrab(xCrab3, yCrab3, thetaCrab3, dStep3, mapHeight, mapWidth);

    %draw new crab
    crab3Graphics = drawCrab(xCrab3, yCrab3, thetaCrab3, sizeCrab3);

    cmd = kbhit();


    if (cmd == "w" || cmd == "a" || cmd == "s" || cmd == "d")

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

