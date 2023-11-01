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
[xNet, yNet, captainGraphics] = drawCapt (xCapt, yCapt, thetaCapt, sizeCapt);

%MOVEMENT
while (true && level != 0)

%Printing
[check, level] = printTo(level, lives, words, numCrabs, numParaCrabs, crabsAlive, paraCrabsAlive, mapHeight, mapWidth);
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

cmd = kbhit(0.25);

if (cmd == "Q")
  lives = 0;
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
  while (words != 'EASY' || words != 'NORMAL' || words != 'HARD')

    title(['Enemy Speed (1) easy | (2) medium | (3) hard | (4) Level Select'], 'FontSize', 20);
    cmd = kbhit();

    if (cmd == "1")
    fprintf('Easy\n');
      step = 20;
      words = 'EASY';
    break
    endif

    if (cmd == "2")
    fprintf('Normal\n');
      step = 40;
      words = 'NORMAL';
    break
    endif

    if (cmd == "3")
      fprintf('Hard\n');
      step = 60;
      words = 'HARD';
    break
  endif

  if (cmd == "4")
    title(['Levels | (1) | (2) | (3) | (4) | (5) | (6) | (7) | (8) | (9) | (0) Custom'], 'FontSize', 20);
    cmd = kbhit();
    if (cmd  == "1" || cmd  == "2" || cmd  == "3" || cmd  == "4" || cmd  == "5"  || cmd  == "6"  || cmd  == "7"  || cmd  == "8" || cmd  == "9")
      level = str2num(cmd) - 1;
      fprintf('Level %d selected\n', level + 1);
    elseif (cmd == "0")
      level = 10;
      fprintf('Custom level selected\n');
      title(['How many crabs?'], 'FontSize', 20);
      cmd = kbhit();
      if (cmd  == "1" || cmd  == "2" || cmd  == "3" || cmd  == "4" || cmd  == "5"  || cmd  == "6"  || cmd  == "7"  || cmd  == "8" || cmd  == "9" || cmd == "0")
        numCrabs = str2num(cmd)
      else
        fprintf('0 crabs defaulted\n');
        numCrabs = 0;
      endif
      title(['How many parachute crabs?'], 'FontSize', 20);
      cmd = kbhit();
      if (cmd  == "1" || cmd  == "2" || cmd  == "3" || cmd  == "4" || cmd  == "5"  || cmd  == "6"  || cmd  == "7"  || cmd  == "8" || cmd  == "9" || cmd == "0")
        if (cmd == "0" && numCrabs == 0)
          fprintf('1 parachute crab required\n');
          numParaCrabs = 1
        else
          numParaCrabs = str2num(cmd)
        endif
      else
        fprintf('0 parachute crabs defaulted\n');
        numParaCrabs = 0;
      endif
      title(['How many fish?'], 'FontSize', 20);
      cmd = kbhit();
      if (cmd  == "1" || cmd  == "2" || cmd  == "3" || cmd  == "4" || cmd  == "5"  || cmd  == "6"  || cmd  == "7"  || cmd  == "8" || cmd  == "9" || cmd == "0")
        numFish = str2num(cmd)
      else
        fprintf('0 fish defaulted\n');
        numFish = 0;
      endif
      title(['How many sharks?'], 'FontSize', 20);
      cmd = kbhit();
      if (cmd  == "1" || cmd  == "2" || cmd  == "3" || cmd  == "4" || cmd  == "5"  || cmd  == "6"  || cmd  == "7"  || cmd  == "8" || cmd  == "9" || cmd == "0")
        numSharks = str2num(cmd)
      else
        fprintf('0 sharks defaulted\n');
        numSharks = 0;
      endif
      title(['How many lives?'], 'FontSize', 20);
      cmd = kbhit();
      if (cmd == "1" || cmd == "2" || cmd == "3" || cmd == "4" || cmd == "5" || cmd == "6" || cmd == "7" || cmd == "8" || cmd == "9")
        lives = str2num(cmd)
      else
        fprintf('5 lives defaulted\n');
        lives = 5
      endif
    else
      level = 1;
      fprintf('Level 1 defaulted\n');
    endif

  endif

    if (cmd == "Q")
      lives = 0;
      break
    endif

endwhile
endif

endfunction
