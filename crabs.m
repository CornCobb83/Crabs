function [lives, step, words, level] = crabs (level, lives, step, words)
counter = 0;
ccounter = 0;
numCrabs = 2;
cmd = "null";

c3alive = false;
pCrab1Alive = false;
pCrab2Alive = false;
pCrab3Alive = false;

fish1alive = false;
fish2alive = false;
fish3alive = false;
fish4alive = false;
fish5alive = false;
fish6alive = false;

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
if (6 - level < 6)
poss = 1;
[xFish1, yFish1, thetaFish1, sizeFish1, dStep1, f1alive, ovr1] = newFish(poss, step);
endif

%level 2
if (6 - level < 5)
poss = 2;
[xFish2, yFish2, thetaFish2, sizeFish2, dStep2, f2alive, ovr2] = newFish(poss, step);
endif

%Level 3
if (6 - level < 4)
poss = 3;
[xFish3, yFish3, thetaFish3, sizeFish3, dStep3, f3alive, ovr3] = newFish(poss, step);
endif

%Level 4
if (6 - level < 3)
poss = 3;
[xFish4, yFish4, thetaFish4, sizeFish4, dStep4, f4alive, ovr4] = newFish(poss, step);
endif

%Level 5
if (6 - level < 2)
poss = 2;
[xFish5, yFish5, thetaFish5, sizeFish5, dStep5, f5alive, ovr5] = newFish(poss, step);
poss = 1;
[xFish6, yFish6, thetaFish6, sizeFish6, dStep6, f6alive, ovr6] = newFish(poss, step);
endif


%Creating crabs
%Level 1
if (6 - level < 6)
[xCrab1, yCrab1, thetaCrab1, sizeCrab1, dStep7, c1alive, ovr7] = newCrab();
[xCrab2, yCrab2, thetaCrab2, sizeCrab2, dStep8, c2alive, ovr8] = newCrab();
numCrabs = 2;
endif

%Level 2
if (6 - level < 5)
[xCrab3, yCrab3, thetaCrab3, sizeCrab3, dStep9, c3alive, ovr9] = newCrab();
numCrabs = 3;
endif

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

%Plotting fish
%Level 1
if (6 - level < 6)
fish1Graphics = drawFish(xFish1, yFish1, thetaFish1, sizeFish1);
endif

%Level 2
if (6 - level < 5)
fish2Graphics = drawFish(xFish2, yFish2, thetaFish2, sizeFish2);
endif

%Level 3
if (6 - level < 4)
fish3Graphics = drawFish(xFish3, yFish3, thetaFish3, sizeFish3);
endif

%Level 4
if (6 - level < 3)
fish4Graphics = drawFish(xFish4, yFish4, thetaFish4, sizeFish4);
endif

%Level 5
if (6 - level < 2)
fish5Graphics = drawFish(xFish5, yFish5, thetaFish5, sizeFish5);
fish6Graphics = drawFish(xFish6, yFish6, thetaFish6, sizeFish6);
endif

%Plotting crabs
%Level 1
if (6 - level < 6)
crab1Graphics = drawCrab(xCrab1, yCrab1, thetaCrab1, sizeCrab1);
crab2Graphics = drawCrab(xCrab2, yCrab2, thetaCrab2, sizeCrab2);
endif

%Level 2
if (6 - level < 5)
crab3Graphics = drawCrab(xCrab3, yCrab3, thetaCrab3, sizeCrab3);
endif

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
%Level 1
if (6 - level < 6)
[xFish1, yFish1, thetaFish1, fish1Graphics, f1alive, ovr1, lives] = runFish(xCapt,yCapt,xFish1,yFish1,f1alive,fish1Graphics,thetaFish1,dStep1,mapHeight,mapWidth,sizeFish1, ovr1, lives);
endif

%Level 2
if (6 - level < 5)
[xFish2, yFish2, thetaFish2, fish2Graphics, f2alive, ovr2, lives] = runFish(xCapt,yCapt,xFish2,yFish2,f2alive,fish2Graphics,thetaFish2,dStep2,mapHeight,mapWidth,sizeFish2, ovr2, lives);
endif

%Level 3
if (6 - level < 4)
[xFish3, yFish3, thetaFish3, fish3Graphics, f3alive, ovr3, lives] = runFish(xCapt,yCapt,xFish3,yFish3,f3alive,fish3Graphics,thetaFish3,dStep3,mapHeight,mapWidth,sizeFish3, ovr3, lives);
endif

%Level 4
if (6 - level < 3)
[xFish4, yFish4, thetaFish4, fish4Graphics, f4alive, ovr4, lives] = runFish(xCapt,yCapt,xFish4,yFish4,f4alive,fish4Graphics,thetaFish4,dStep4,mapHeight,mapWidth,sizeFish4, ovr4, lives);
endif

%Level 5
if (6 - level < 2)
[xFish5, yFish5, thetaFish5, fish5Graphics, f5alive, ovr5, lives] = runFish(xCapt,yCapt,xFish5,yFish5,f5alive,fish5Graphics,thetaFish5,dStep5,mapHeight,mapWidth,sizeFish5, ovr5, lives);
[xFish6, yFish6, thetaFish6, fish6Graphics, f6alive, ovr6, lives] = runFish(xCapt,yCapt,xFish6,yFish6,f6alive,fish6Graphics,thetaFish6,dStep6,mapHeight,mapWidth,sizeFish6, ovr6, lives);
endif

%Moving crabs accordingly
%Level 1
if (6 - level < 6)
[xCrab1, yCrab1, thetaCrab1, crab1Graphics, c1alive, dStep7, ovr7, ccounter] = runCrab(xCapt,yCapt,thetaCapt,xCrab1,yCrab1,c1alive,crab1Graphics,thetaCrab1,dStep7,mapHeight,mapWidth,sizeCrab1, ovr7, ccounter, net);
[xCrab2, yCrab2, thetaCrab2, crab2Graphics, c2alive, dStep8, ovr8, ccounter] = runCrab(xCapt,yCapt,thetaCapt,xCrab2,yCrab2,c2alive,crab2Graphics,thetaCrab2,dStep8,mapHeight,mapWidth,sizeCrab2, ovr8, ccounter, net);
endif

%Level 2
if (6 - level < 5)
[xCrab3, yCrab3, thetaCrab3, crab3Graphics, c3alive, dStep9, ovr9, ccounter] = runCrab(xCapt,yCapt,thetaCapt,xCrab3,yCrab3,c3alive,crab3Graphics,thetaCrab3,dStep9,mapHeight,mapWidth,sizeCrab3, ovr9, ccounter, net);
endif

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
if (lives > 0) && (c1alive || c2alive || c3alive || pCrab1Alive || pCrab2Alive || pCrab3Alive)
  ccounter;
  title([words '           Lives ' num2str(lives) '           Level: ' num2str(level) '           Crabs collected ' num2str(ccounter) '/' num2str(numCrabs)], 'FontSize', 30);
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
