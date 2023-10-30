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

% Define fish variables
vars = {'xFish', 'yFish', 'thetaFish', 'sizeFish', 'dStep', 'falive', 'ovr'};
x = numFish;
fish = varArray(vars, x);

%creating fish
for i = 1:numFish
  mult = (i-1) * 7;
  [xFish(i), yFish(i), fish(mult+3), fish(mult+4), fish(mult+5), fish(mult+6), fish(mult+7)] = newFish(i, step);
  fishGraphics{i} = drawFish(xFish(i), yFish(i), fish(mult+3), fish(mult+4));
endfor

% Define crab variables
vars = {'xCrab', 'yCrab', 'thetaCrab', 'sizeCrab', 'dStep', 'calive', 'ovr'};
x = numCrabs;
crab = varArray(vars, x);

% Creating crabs
for i = 1:numCrabs
  mult = (i-1) * 7;
  [crab(mult+1), crab(mult+2), crab(mult+3), crab(mult+4), crab(mult+5), crab(mult+6), crab(mult+7)] = newCrab();
  crabGraphics{i} = drawCrab(crab(mult+1), crab(mult+2), crab(mult+3), crab(mult+4));
endfor

% Define parachute crab variables
vars = {'xCrab', 'yCrab', 'thetaCrab', 'sizeCrab', 'dStep', 'calive', 'ovr', 'sc'};
x = numParaCrabs;
paraCrab = varArray(vars, x);

% Creating parachute crabs
for i = 1:numParaCrabs
  mult = (i-1) * 8;
  [paraCrab(mult+1), paraCrab(mult+2), paraCrab(mult+3), paraCrab(mult+4), paraCrab(mult+5), paraCrab(mult+6), paraCrab(mult+7), paraCrab(mult+8)] = newPCrab();
  paraCrabGraphics{i} = drawParaCrab(paraCrab(mult+1), paraCrab(mult+2), paraCrab(mult+3), paraCrab(mult+4));
endfor

% Define shark variables
vars = {'xShark', 'yShark', 'thetaShark', 'sizeShark', 'dStep', 'falive', 'ovr'};
x = numSharks;
shark = varArray(vars, x);

%creating shark
for i = 1:numSharks
  mult = (i-1) * 7;
  [shark(mult+1), shark(mult+2), shark(mult+3), shark(mult+4), shark(mult+5), shark(mult+6), shark(mult+7)] = newShark(i, step);
  sharkGraphics{i} = drawShark(shark(mult+1), shark(mult+2), shark(mult+3), shark(mult+4));
endfor

%Plotting captain
[xNet, yNet, captainGraphics] = drawCapt (xCapt, yCapt, thetaCapt, sizeCapt);

%MOVEMENT
while (true && level != 0)

if (iscell(crabsAlive))
  crabsAlive = cell2mat(crabsAlive);
endif

if (lives > 0) && (crabsAlive > 0 || paraCrabsAlive > 0)
  if (level != 10)
    title([words '           Lives ' num2str(lives) '           Level: ' num2str(level) '           Crabs collected ' num2str((numCrabs + numParaCrabs) - crabsAlive - paraCrabsAlive) '/' num2str(numCrabs + numParaCrabs)], 'FontSize', 30);
  else
    title([words '           Lives ' num2str(lives) '           CUSTOM           Crabs collected ' num2str((numCrabs + numParaCrabs) - crabsAlive - paraCrabsAlive) '/' num2str(numCrabs + numParaCrabs)], 'FontSize', 30);
  endif
elseif (lives > 0 && level == 10)
  fprintf('You beat your custom level with %d lives remaining!\n', lives);
  level += 1;
  break
elseif (lives > 0 && level != 9)
  fprintf('You beat Level %d with %d lives remaining!\n', level, lives);
  break
elseif (lives > 0 && level == 9)
  fprintf('You beat the game on %s difficulty\n', words);
  level = 11;
  break
else
  if (level != 10)
    fprintf('You Lost! You made it to level %d!\n', level);
  else
    fprintf('You lost on your custom level!\n');
    level += 1;
  endif
  break
endif

%Moving fish accordingly

for i = 1:numFish
  if (isgraphics(fishGraphics{i}))
  mult = (i-1) * 7;
  [xFish(i), yFish(i), fish(mult+3), fishGraphics{i}, fish(mult+6), fish(mult+7), lives] = runFish(xCapt,yCapt,xFish(i),yFish(i),fish(mult+6),fishGraphics{i},fish(mult+3),fish(mult+5),mapHeight,mapWidth,fish(mult+4), fish(mult+7), lives);
  endif
endfor

%Moving crabs accordingly

for i = 1:numCrabs
  if (isgraphics(crabGraphics{i}))
  mult = (i-1) * 7;
  [crab(mult+1), crab(mult+2), crab(mult+3), crabGraphics{i}, crab(mult+4), crab(mult+5), crab(mult+6), crab(mult+7), crabsAlive] = runCrab(xCapt,yCapt,crab(mult+1),crab(mult+2),crab(mult+6),crabGraphics{i},crab(mult+3),crab(mult+5),mapHeight,mapWidth,crab(mult+4), crab(mult+7), xNet, yNet, crabsAlive);
  endif
endfor

%Moving parachute crabs accordingly

for i = 1:numParaCrabs
  if (isgraphics(paraCrabGraphics{i}))
  mult = (i-1) * 8;
  [paraCrab(mult+1), paraCrab(mult+2), paraCrab(mult+3), paraCrabGraphics{i}, paraCrab(mult+6), paraCrab(mult+5), paraCrab(mult+7), paraCrab(mult+8), paraCrabsAlive] = runParaCrab(xCapt,yCapt, thetaCapt, paraCrab(mult+1),paraCrab(mult+2),paraCrab(mult+6),paraCrabGraphics{i},paraCrab(mult+3),paraCrab(mult+5),mapHeight,mapWidth,paraCrab(mult+4), paraCrab(mult+7),xNet, yNet,paraCrab(mult+8),paraCrabsAlive);
  endif
endfor

%Moving shark accordingly

for i = 1:numSharks
  if (isgraphics(sharkGraphics{i}))
  mult = (i-1) * 7;
  [shark(mult+1), shark(mult+2), shark(mult+3), sharkGraphics{i}, shark(mult+6), shark(mult+7), lives] = runShark(xCapt,yCapt,shark(mult+1),shark(mult+2),shark(mult+6),sharkGraphics{i},shark(mult+3),shark(mult+5),mapHeight,mapWidth,shark(mult+4), shark(mult+7), lives);
  endif
endfor

cmd = kbhit(0.25);

if (cmd == "Q")
  lives = 0;
  close all
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
