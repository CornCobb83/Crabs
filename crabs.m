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
fishVars = varArray(vars, x);

%creating fish
for i = 1:numFish
  mult = (i-1) * 7;
  [fishVars(mult+1), fishVars(mult+2), fishVars(mult+3), fishVars(mult+4), fishVars(mult+5), fishVars(mult+6), fishVars(mult+7)] = newFish(i, step);
  fishGraphics{i} = drawFish(fishVars(mult+1), fishVars(mult+2), fishVars(mult+3), fishVars(mult+4));
endfor

% Define crab variables
vars = {'xCrab', 'yCrab', 'thetaCrab', 'sizeCrab', 'dStep', 'calive', 'ovr'};
x = numCrabs;
crabVars = varArray(vars, x);

% Creating crabs
for i = 1:numCrabs
  mult = (i-1) * 7;
  [crabVars(mult+1), crabVars(mult+2), crabVars(mult+3), crabVars(mult+4), crabVars(mult+5), crabVars(mult+6), crabVars(mult+7)] = newCrab();
  crabGraphics{i} = drawCrab(crabVars(mult+1), crabVars(mult+2), crabVars(mult+3), crabVars(mult+4));
endfor

% Define parachute crab variables
vars = {'xCrab', 'yCrab', 'thetaCrab', 'sizeCrab', 'dStep', 'calive', 'ovr', 'sc'};
x = numParaCrabs;
ParaCrabVars = varArray(vars, x);

% Creating parachute crabs
for i = 1:numParaCrabs
  mult = (i-1) * 8;
  [ParaCrabVars(mult+1), ParaCrabVars(mult+2), ParaCrabVars(mult+3), ParaCrabVars(mult+4), ParaCrabVars(mult+5), ParaCrabVars(mult+6), ParaCrabVars(mult+7), ParaCrabVars(mult+8)] = newPCrab();
  paraCrabGraphics{i} = drawParaCrab(ParaCrabVars(mult+1), ParaCrabVars(mult+2), ParaCrabVars(mult+3), ParaCrabVars(mult+4));
endfor

% Define shark variables
vars = {'xShark', 'yShark', 'thetaShark', 'sizeShark', 'dStep', 'falive', 'ovr'};
x = numSharks;
sharkVars = varArray(vars, x);

%creating shark
for i = 1:numSharks
  mult = (i-1) * 7;
  [sharkVars(mult+1), sharkVars(mult+2), sharkVars(mult+3), sharkVars(mult+4), sharkVars(mult+5), sharkVars(mult+6), sharkVars(mult+7)] = newShark(i, step);
  sharkGraphics{i} = drawShark(sharkVars(mult+1), sharkVars(mult+2), sharkVars(mult+3), sharkVars(mult+4));
endfor

%Plotting captain
captainGraphics = drawCapt (xCapt, yCapt, thetaCapt, sizeCapt);

%MOVEMENT
while (true && level != 0)

%Code for setting collect point to net location
capt = getCapt(sizeCapt, xCapt, yCapt, thetaCapt);
R = getRotation(thetaCapt);
captRotated = R * capt;
T = getTranslation(xCapt, yCapt);
capt = T * captRotated;
net = capt(:, 19);

% Extract x and y values from net(1, :)
xNet = net(1);  % Extract the x-value
yNet = net(2);  % Extract the y-value

%Moving fish accordingly

for i = 1:numFish
  mult = (i-1) * 7;
  [fishVars(mult+1), fishVars(mult+2), fishVars(mult+3), fishGraphics{i}, fishVars(mult+6), fishVars(mult+7), lives] = runFish(xCapt,yCapt,fishVars(mult+1),fishVars(mult+2),fishVars(mult+6),fishGraphics{i},fishVars(mult+3),fishVars(mult+5),mapHeight,mapWidth,fishVars(mult+4), fishVars(mult+7), lives);
endfor

%Moving crabs accordingly

for i = 1:numCrabs
  mult = (i-1) * 7;
  [crabVars(mult+1), crabVars(mult+2), crabVars(mult+3), crabGraphics{i}, crabVars(mult+4), crabVars(mult+5), crabVars(mult+6), crabVars(mult+7), crabsAlive] = runCrab(xCapt,yCapt,crabVars(mult+1),crabVars(mult+2),crabVars(mult+6),crabGraphics{i},crabVars(mult+3),crabVars(mult+5),mapHeight,mapWidth,crabVars(mult+4), crabVars(mult+7), xNet, yNet, crabsAlive);
endfor

%Moving parachute crabs accordingly

for i = 1:numParaCrabs
  mult = (i-1) * 8;
  [ParaCrabVars(mult+1), ParaCrabVars(mult+2), ParaCrabVars(mult+3), paraCrabGraphics{i}, ParaCrabVars(mult+6), ParaCrabVars(mult+5), ParaCrabVars(mult+7), ParaCrabVars(mult+8), paraCrabsAlive] = runParaCrab(xCapt,yCapt, thetaCapt, ParaCrabVars(mult+1),ParaCrabVars(mult+2),ParaCrabVars(mult+6),paraCrabGraphics{i},ParaCrabVars(mult+3),ParaCrabVars(mult+5),mapHeight,mapWidth,ParaCrabVars(mult+4), ParaCrabVars(mult+7),xNet, yNet,ParaCrabVars(mult+8),paraCrabsAlive);
endfor

%Moving shark accordingly

for i = 1:numSharks
  mult = (i-1) * 7;
  [sharkVars(mult+1), sharkVars(mult+2), sharkVars(mult+3), sharkGraphics{i}, sharkVars(mult+6), sharkVars(mult+7), lives] = runShark(xCapt,yCapt,sharkVars(mult+1),sharkVars(mult+2),sharkVars(mult+6),sharkGraphics{i},sharkVars(mult+3),sharkVars(mult+5),mapHeight,mapWidth,sharkVars(mult+4), sharkVars(mult+7), lives);
endfor

cmd = kbhit(1);

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
      captainGraphics = drawCapt(xCapt, yCapt, thetaCapt, sizeCapt);

endif

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
  fprintf('You beat your level with %d lives remaining!\n', lives);
  level += 1;
  break
elseif (lives > 0 && level != 9)
  fprintf('You Beat Level %d with %d lives remaining!\n', level, lives);
  break
elseif (lives > 0 && level == 9)
  fprintf('You Won on %s difficulty\n', words);
  break
else
  if (level != 10)
    fprintf('You Lost! You made it to level %d!\n', level);
  else
    fprintf('You Lost on your custom level!\n');
    level += 1;
  endif
  break
endif

fflush(stdout);
pause(.01);

endwhile

if (level == 0)
  while (words != 'EASY' || words != 'NORMAL' || words != 'HARD')

    title(['Enemy Speed (1) easy | (2) medium | (3) hard | (4) Level Select'], 'FontSize', 20);
    cmd = kbhit();

    if (cmd == "1")
    fprintf('Easy\n');
      step = 30;
      words = 'EASY';
    break
    endif

    if (cmd == "2")
    fprintf('Normal\n');
      step = 50;
      words = 'NORMAL';
    break
    endif

    if (cmd == "3")
      fprintf('Hard\n');
      step = 100;
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
