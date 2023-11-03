function [lives, step, words, level, numFish, numCrabs, numParaCrabs, numSharks] = crabs (level, lives, step, words, numFish, numCrabs, numParaCrabs, numSharks)
counter = 0;
cmd = "null";

crabsAlive = numCrabs;
paraCrabsAlive = numParaCrabs;

[mapHeight , mapWidth] = drawMap( "BGImage.png", counter );

%Creating captain
xCapt = 1000;
yCapt = 500;
thetaCapt = -pi/2;
sizeCapt = 50;
dStep = 50;

% Fish variables
% vars = {'xFish', 'yFish', 'thetaFish', 'sizeFish', 'fdStep', 'falive', 'fovr'};

%creating fish
for i = 1:numFish
  [xFish(i), yFish(i), thetaFish(i), sizeFish(i), fdStep(i), falive(i), fovr(i)] = newFish(i, step);
  fishGraphics{i} = drawFish(xFish(i), yFish(i), thetaFish(i), sizeFish(i));
endfor

% Crab variables
% vars = {'xCrab', 'yCrab', 'thetaCrab', 'sizeCrab', 'cdStep', 'calive', 'ovr'};

% Creating crabs
for i = 1:numCrabs
  [xCrab(i), yCrab(i), thetaCrab(i), sizeCrab(i), cdStep(i), calive(i), ovr(i)] = newCrab();
  crabGraphics{i} = drawCrab(xCrab(i), yCrab(i), thetaCrab(i), sizeCrab(i));
endfor

% Parachute crab variables
% vars = {'paraxCrab', 'parayCrab', 'parathetaCrab', 'parasizeCrab', 'paradStep', 'paracalive', 'paraovr', 'sc'};

% Creating parachute crabs
for i = 1:numParaCrabs
  [paraxCrab(i), parayCrab(i), parathetaCrab(i), parasizeCrab(i), paradStep(i), paracalive(i), paraovr(i), sc(i)] = newPCrab();
  paraCrabGraphics{i} = drawParaCrab(paraxCrab(i), parayCrab(i), parathetaCrab(i), parasizeCrab(i));
endfor

% Define shark variables
% vars = {'xShark', 'yShark', 'thetaShark', 'sizeShark', 'sdStep', 'salive', 'sovr'};

%creating shark
for i = 1:numSharks
  [xShark(i), yShark(i), thetaShark(i), sizeShark(i), sdStep(i), salive(i), sovr(i)] = newShark(i, step);
  sharkGraphics{i} = drawShark(xShark(i), yShark(i), thetaShark(i), sizeShark(i));
endfor

%Plotting captain
if (level > 0)
  [xNet, yNet, captainGraphics] = drawCapt (xCapt, yCapt, thetaCapt, sizeCapt);
endif

%Running game with given vars
while (true && level > 0)

%Printing
[level, check] = printTo(level, lives, words, numCrabs, numParaCrabs, crabsAlive, paraCrabsAlive, mapHeight, mapWidth, xCapt, yCapt, thetaCapt, sizeCapt, captainGraphics);
if (check == false)
  break
endif

%Moving fish accordingly

for i = 1:numFish
  if (isgraphics(fishGraphics{i}))
  [xFish(i), yFish(i), thetaFish(i), fishGraphics{i}, falive(i), fovr(i), lives] = runFish(xCapt,yCapt,xFish(i),yFish(i),falive(i),fishGraphics{i},thetaFish(i),fdStep(i),mapHeight,mapWidth,sizeFish(i), fovr(i), lives);
  endif
endfor

%Moving crabs accordingly

for i = 1:numCrabs
  if (isgraphics(crabGraphics{i}))
  [xCrab(i), yCrab(i), thetaCrab(i), crabGraphics{i}, sizeCrab(i), cdStep(i), calive(i), ovr(i), crabsAlive] = runCrab(xCapt,yCapt,xCrab(i),yCrab(i),calive(i),crabGraphics{i},thetaCrab(i),cdStep(i),mapHeight,mapWidth,sizeCrab(i), ovr(i), xNet, yNet, crabsAlive);
  endif
endfor

%Moving parachute crabs accordingly

for i = 1:numParaCrabs
  if (isgraphics(paraCrabGraphics{i}))
  [paraxCrab(i), parayCrab(i), parathetaCrab(i), paraCrabGraphics{i}, paracalive(i), paradStep(i), paraovr(i), sc(i), paraCrabsAlive] = runParaCrab(xCapt,yCapt, thetaCapt, paraxCrab(i),parayCrab(i),paracalive(i),paraCrabGraphics{i},parathetaCrab(i),paradStep(i),mapHeight,mapWidth,parasizeCrab(i), paraovr(i),xNet, yNet,sc(i),paraCrabsAlive);
  endif
endfor

%Moving shark accordingly

for i = 1:numSharks
  if (isgraphics(sharkGraphics{i}))
  [xShark(i), yShark(i), thetaShark(i), sharkGraphics{i}, salive(i), sovr(i), lives] = runShark(xCapt,yCapt,xShark(i),yShark(i),salive(i),sharkGraphics{i},thetaShark(i),sdStep(i),mapHeight,mapWidth,sizeShark(i), sovr(i), lives);
  endif
endfor

cmd = kbhit(1);

if (cmd == "Q")
  level = 11;
  break
endif

%Keyboard interactions
if (cmd == "w" || cmd == "a" || cmd == "s" || cmd == "d")

    if isgraphics(captainGraphics)
      delete(captainGraphics);
    endif

      %move captain
      [xCapt, yCapt, thetaCapt] = moveCaptain(cmd, xCapt, yCapt, thetaCapt, dStep, mapHeight, mapWidth);

      %draw new captain
      [xNet, yNet, captainGraphics] = drawCapt(xCapt, yCapt, thetaCapt, sizeCapt);

endif

fflush(stdout);
pause(0.01);

endwhile

if (level == 0)

    [words, level, lives, numCrabs, numFish, numParaCrabs, numSharks, cmd] = level0 ();

endif

endfunction
