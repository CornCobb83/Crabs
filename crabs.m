function [lives, step, words, level] = crabs (level, lives, step, words)
counter = 0;
cmd = "null";
numFish = 0;
numCrabs = 0;
numParaCrabs = 0;

[mapHeight , mapWidth] = drawMap( "BGImage.png", counter );

if (level == 0)
  while (cmd != "1" || cmd != "2" || cmd != "3" || cmd != "4")
    zout = 0;

    if (zout == 0)
      title(['Enemy Speed (1) easy | (2) medium | (3) hard | (4) Dev Mode'], 'FontSize', 20);
    else
      title(['Enemy Speed (1) easy | (2) medium | (3) hard'], 'FontSize', 20);
    endif
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

  if (zout == 0)
  if (cmd == "4")
    title(['Levels | (1) | (2) | (3) | (4) | (5)'], 'FontSize', 20);
    cmd = kbhit();
    if (cmd  == "1")
      level = 1;
      fprintf('Level 1 selected\n');
    elseif (cmd == "2")
      level = 2;
      fprintf('Level 2 selected\n');
    elseif (cmd == "3")
      level = 3;
      fprintf('Level 3 selected\n');
    elseif (cmd == "4")
      level = 4;
      fprintf('Level 4 selected\n');
    elseif (cmd == "5")
      level = 5;
      fprintf('Level 5 selected\n');
    else
      level = 1;
      fprintf('Level 1 defaulted\n');
    endif
    title(['How many lives? (1 - 9)'], 'FontSize', 20);
    cmd = kbhit();
    if (cmd == "1" || cmd == "2" || cmd == "3" || cmd == "4" || cmd == "5" || cmd == "6" || cmd == "7" || cmd == "8" || cmd == "9")
      lives = str2num(cmd)
      zout += 1;
    else
      lives = 5
      zout += 1;
    endif
  endif
  endif

    if (cmd == "Q")
      lives = 0;
      break
    endif

endwhile
endif

%Creating captain
xCapt = 1000;
yCapt = 500;
thetaCapt = -pi/2;
sizeCapt = 50;
dStep = 50;

%Level 1
if (level == 1)
numFish = 1;
numCrabs = 2;
numParaCrabs = 0;
endif

%level 2
if (level == 2)
numFish = 2;
numCrabs = 3;
numParaCrabs = 0;
endif

%Level 3
if (level == 3)
numFish = 3;
numCrabs = 3;
numParaCrabs = 1;
endif

%Level 4
if (level == 4)
numFish = 4;
numCrabs = 3;
numParaCrabs = 2;
endif

%Level 5
if (level == 5)
numFish = 6;
numCrabs = 3;
numParaCrabs = 3;
endif

crabsAlive = numCrabs;
paraCrabsAlive = numParaCrabs;

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
  mult = (i-1) * 7;
  [ParaCrabVars(mult+1), ParaCrabVars(mult+2), ParaCrabVars(mult+3), ParaCrabVars(mult+4), ParaCrabVars(mult+5), ParaCrabVars(mult+6), ParaCrabVars(mult+7), ParaCrabVars(mult+8)] = newPCrab();
  paraCrabGraphics{i} = drawParaCrab(ParaCrabVars(mult+1), ParaCrabVars(mult+2), ParaCrabVars(mult+3), ParaCrabVars(mult+4));
endfor

%Plotting captain
captainGraphics = drawCapt (xCapt, yCapt, thetaCapt, sizeCapt);

%MOVEMENT
while (cmd != "Q" && level != 0)
cmd = kbhit();
if (cmd == "Q")
  lives = 0;
  close all
endif
counter += 1;


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

%Counting lives
%Lives reduce if captain collides with fish, end game at 3 lives

if (iscell(crabsAlive))
  crabsAlive = cell2mat(crabsAlive);
endif

if (lives > 0) && (crabsAlive > 0 || paraCrabsAlive > 0)
  title([words '           Lives ' num2str(lives) '           Level: ' num2str(level) '           Crabs collected ' num2str((numCrabs + numParaCrabs) - crabsAlive - paraCrabsAlive) '/' num2str(numCrabs + numParaCrabs)], 'FontSize', 30);
elseif (lives > 0 && level != 5)
  fprintf('You Beat Level %d with %d lives remaining!\n', level, lives);
  break
elseif (lives > 0 && level == 5)
  fprintf('You Won on %s difficulty\n', words);
  break
else
  fprintf('You Lost! You made it to level %d!\n', level);
  break
end

%fflush(stdout);
%pause(.05);

endwhile

endfunction
