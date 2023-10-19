function [lives, step, words, level] = crabs (level, lives, step, words)
counter = 0;
cmd = "null";
numFish = 0;
numCrabs = 0;

pCrab2Alive = false;
pCrab3Alive = false;

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

%1 = top, 2 = left, 3 = right

%Creating fish
%Level 1
if (level == 1)
numFish = 1;
numCrabs = 2;
endif

%level 2
if (level == 2)
numFish = 2;
numCrabs = 3;
endif

%Level 3
if (level == 3)
numFish = 3;
numCrabs = 3;
endif

%Level 4
if (level == 4)
numFish = 4;
numCrabs = 3;
endif

%Level 5
if (level == 5)
numFish = 6;
numCrabs = 3;
endif

crabsAlive = numCrabs;

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

%Creating parachute crabs
%Level 3
if (6 - level < 4);
[xpCrab1, ypCrab1, thetapCrab1, sizepCrab1, dpStep10, pCrab1Alive, ovr10, sc1] = newPCrab();
numCrabs = 4;
endif

%level 4
if (6 - level < 3)
[xpCrab2, ypCrab2, thetapCrab2, sizepCrab2, dpStep11, pCrab2Alive, ovr11, sc2] = newPCrab();
numCrabs = 5;
endif

%Level 5
if (6 - level < 2)
[xpCrab3, ypCrab3, thetapCrab3, sizepCrab3, dpStep12, pCrab3Alive, ovr12, sc3] = newPCrab();
numCrabs = 6;
endif

%PLOTTING FIGURES

%Plotting captain
captainGraphics = drawCapt (xCapt, yCapt, thetaCapt, sizeCapt);

%Plotting parachute crabs
%Level 3
if (6 - level < 4)
paraCrab1Graphics = drawParaCrab(xpCrab1, ypCrab1, thetapCrab1, sizepCrab1);
endif

%Level 4
if (6 - level < 3)
paraCrab2Graphics = drawParaCrab(xpCrab2, ypCrab2, thetapCrab2, sizepCrab2);
endif

%Level 5
if (6 - level < 2)
paraCrab3Graphics = drawParaCrab(xpCrab3, ypCrab3, thetapCrab3, sizepCrab3);
endif


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
captRotated = R*capt;
T = getTranslation(xCapt,yCapt);
capt = T*captRotated;
net = capt( : , 19);
net(1, : );
net(2, : );

%Moving fish accordingly

for i = 1:numFish
  mult = (i-1) * 7;
  [fishVars(mult+1), fishVars(mult+2), fishVars(mult+3), fishGraphics{i}, fishVars(mult+6), fishVars(mult+7), lives] = runFish(xCapt,yCapt,fishVars(mult+1),fishVars(mult+2),fishVars(mult+6),fishGraphics{i},fishVars(mult+3),fishVars(mult+5),mapHeight,mapWidth,fishVars(mult+4), fishVars(mult+7), lives);
endfor

%Moving crabs accordingly

for i = 1:numCrabs
  mult = (i-1) * 7;
  [crabVars(mult+1), crabVars(mult+2), crabVars(mult+3), crabGraphics{i}, crabVars(mult+4), crabVars(mult+5), crabVars(mult+6), crabVars(mult+7), crabsAlive] = runCrab(xCapt,yCapt,crabVars(mult+1),crabVars(mult+2),crabVars(mult+6),crabGraphics{i},crabVars(mult+3),crabVars(mult+5),mapHeight,mapWidth,crabVars(mult+4), crabVars(mult+7), net, crabsAlive);
endfor

%Moving parachute crabs accordingly
%Level 3
if (6 - level < 4)
[xpCrab1, ypCrab1, thetapCrab1, paraCrab1Graphics, pCrab1Alive, dpStep10, ovr10, ccounter, sc1] = runParaCrab(xCapt,yCapt,thetaCapt,xpCrab1,ypCrab1,pCrab1Alive,paraCrab1Graphics,thetapCrab1,dpStep10,mapHeight,mapWidth,sizepCrab1, ovr10, ccounter, net, sc1);
endif

%Level 4
if (6 - level < 3)
[xpCrab2, ypCrab2, thetapCrab2, paraCrab2Graphics, pCrab2Alive, dpStep11, ovr11, ccounter, sc2] = runParaCrab(xCapt,yCapt,thetaCapt,xpCrab2,ypCrab2,pCrab2Alive,paraCrab2Graphics,thetapCrab2,dpStep11,mapHeight,mapWidth,sizepCrab2, ovr11, ccounter, net, sc2);
endif

%Level 5
if (6 - level < 2)
[xpCrab3, ypCrab3, thetapCrab3, paraCrab3Graphics, pCrab3Alive, dpStep12, ovr12, ccounter, sc3] = runParaCrab(xCapt,yCapt,thetaCapt,xpCrab3,ypCrab3,pCrab3Alive,paraCrab3Graphics,thetapCrab3,dpStep12,mapHeight,mapWidth,sizepCrab3, ovr12, ccounter, net, sc3);
endif

%Counting lives
%Lives reduce if captain collides with fish, end game at 3 lives

if (iscell(crabsAlive))
  crabsAlive = cell2mat(crabsAlive);
endif

if (lives > 0) && (crabsAlive > 0 || pCrab2Alive || pCrab3Alive)
  title([words '           Lives ' num2str(lives) '           Level: ' num2str(level) '           Crabs collected ' num2str((numCrabs) - crabsAlive) '/' num2str(numCrabs)], 'FontSize', 30);
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
