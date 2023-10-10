function crabs ()
counter = 0;
ccounter = 0;
lives = 3;
[mapHeight , mapWidth] = drawMap( "BGImage.png", counter );

xCapt = 1000;
yCapt = 500;
thetaCapt = -pi/2;
sizeCapt = 50;
dStep = 50;

%1 = top, 2 = left, 3 = right
%Creating fish
poss = 1;
[xFish1, yFish1, thetaFish1, sizeFish1, dStep1, f1alive, ovr1] = newFish(poss);
poss = 2;
[xFish2, yFish2, thetaFish2, sizeFish2, dStep2, f2alive, ovr2] = newFish(poss);
poss = 3;
[xFish3, yFish3, thetaFish3, sizeFish3, dStep3, f3alive, ovr3] = newFish(poss);
poss = 3;
[xFish4, yFish4, thetaFish4, sizeFish4, dStep4, f4alive, ovr4] = newFish(poss);
poss = 2;
[xFish5, yFish5, thetaFish5, sizeFish5, dStep5, f5alive, ovr5] = newFish(poss);
poss = 1;
[xFish6, yFish6, thetaFish6, sizeFish6, dStep6, f6alive, ovr6] = newFish(poss);

%Creating crabs
[xCrab1, yCrab1, thetaCrab1, sizeCrab1, dStep7, c1alive, ovr7] = newCrab();
[xCrab2, yCrab2, thetaCrab2, sizeCrab2, dStep8, c2alive, ovr8] = newCrab();
[xCrab3, yCrab3, thetaCrab3, sizeCrab3, dStep9, c3alive, ovr9] = newCrab();

%Create parachute crabs
[xpCrab1, ypCrab1, thetapCrab1, sizepCrab1, dpStep10, pCrab1Alive, ovr10] = newPCrab();
[xpCrab2, ypCrab2, thetapCrab2, sizepCrab2, dpStep11, pCrab2Alive, ovr11] = newPCrab();
[xpCrab3, ypCrab3, thetapCrab3, sizepCrab3, dpStep12, pCrab3Alive, ovr12] = newPCrab();

%Creating captain
captainGraphics = drawCapt (xCapt, yCapt, thetaCapt, sizeCapt);

%Plotting fish
fish1Graphics = drawFish(xFish1, yFish1, thetaFish1, sizeFish1);
fish2Graphics = drawFish(xFish2, yFish2, thetaFish2, sizeFish2);
fish3Graphics = drawFish(xFish3, yFish3, thetaFish3, sizeFish3);
fish4Graphics = drawFish(xFish4, yFish4, thetaFish4, sizeFish4);
fish5Graphics = drawFish(xFish5, yFish5, thetaFish5, sizeFish5);
fish6Graphics = drawFish(xFish6, yFish6, thetaFish6, sizeFish6);

%Plotting crabs
crab1Graphics = drawCrab(xCrab1, yCrab1, thetaCrab1, sizeCrab1);
crab2Graphics = drawCrab(xCrab2, yCrab2, thetaCrab2, sizeCrab2);
crab3Graphics = drawCrab(xCrab3, yCrab3, thetaCrab3, sizeCrab3);

%Plotting parachute crabs
paraCrab1Graphics = drawParaCrab(xpCrab1, ypCrab1, thetapCrab1, sizepCrab1);
paraCrab2Graphics = drawParaCrab(xpCrab2, ypCrab2, thetapCrab2, sizepCrab2);
paraCrab3Graphics = drawParaCrab(xpCrab3, ypCrab3, thetapCrab3, sizepCrab3);

cmd = "null";

while (cmd != "Q" )
cmd = kbhit();
counter += 1;

%Moving fish accordingly
[xFish1, yFish1, thetaFish1, fish1Graphics, f1alive, ovr1, lives] = runFish(xCapt,yCapt,xFish1,yFish1,f1alive,fish1Graphics,thetaFish1,dStep1,mapHeight,mapWidth,sizeFish1, ovr1, lives);
[xFish2, yFish2, thetaFish2, fish2Graphics, f2alive, ovr2, lives] = runFish(xCapt,yCapt,xFish2,yFish2,f2alive,fish2Graphics,thetaFish2,dStep2,mapHeight,mapWidth,sizeFish2, ovr2, lives);
[xFish3, yFish3, thetaFish3, fish3Graphics, f3alive, ovr3, lives] = runFish(xCapt,yCapt,xFish3,yFish3,f3alive,fish3Graphics,thetaFish3,dStep3,mapHeight,mapWidth,sizeFish3, ovr3, lives);
[xFish4, yFish4, thetaFish4, fish4Graphics, f4alive, ovr4, lives] = runFish(xCapt,yCapt,xFish4,yFish4,f4alive,fish4Graphics,thetaFish4,dStep4,mapHeight,mapWidth,sizeFish4, ovr4, lives);
[xFish5, yFish5, thetaFish5, fish5Graphics, f5alive, ovr5, lives] = runFish(xCapt,yCapt,xFish5,yFish5,f5alive,fish5Graphics,thetaFish5,dStep5,mapHeight,mapWidth,sizeFish5, ovr5, lives);
[xFish6, yFish6, thetaFish6, fish6Graphics, f6alive, ovr6, lives] = runFish(xCapt,yCapt,xFish6,yFish6,f6alive,fish6Graphics,thetaFish6,dStep6,mapHeight,mapWidth,sizeFish6, ovr6, lives);

%Moving crabs accordingly
[xCrab1, yCrab1, thetaCrab1, crab1Graphics, c1alive, dStep7, ovr7, ccounter] = runCrab(xCapt,yCapt,xCrab1,yCrab1,c1alive,crab1Graphics,thetaCrab1,dStep7,mapHeight,mapWidth,sizeCrab1, ovr7, ccounter);
[xCrab2, yCrab2, thetaCrab2, crab2Graphics, c2alive, dStep8, ovr8, ccounter] = runCrab(xCapt,yCapt,xCrab2,yCrab2,c2alive,crab2Graphics,thetaCrab2,dStep8,mapHeight,mapWidth,sizeCrab2, ovr8, ccounter);
[xCrab3, yCrab3, thetaCrab3, crab3Graphics, c3alive, dStep9, ovr9, ccounter] = runCrab(xCapt,yCapt,xCrab3,yCrab3,c3alive,crab3Graphics,thetaCrab3,dStep9,mapHeight,mapWidth,sizeCrab3, ovr9, ccounter);

%Moving parachute crabs accordingly
[xpCrab1, ypCrab1, thetapCrab1, paraCrab1Graphics, pCrab1Alive, dpStep10, ovr10, ccounter] = runParaCrab(xCapt,yCapt,xpCrab1,ypCrab1,pCrab1Alive,paraCrab1Graphics,thetapCrab1,dpStep10,mapHeight,mapWidth,sizepCrab1, ovr10, ccounter);
[xpCrab2, ypCrab2, thetapCrab2, paraCrab2Graphics, pCrab2Alive, dpStep11, ovr11, ccounter] = runParaCrab(xCapt,yCapt,xpCrab2,ypCrab2,pCrab2Alive,paraCrab2Graphics,thetapCrab2,dpStep11,mapHeight,mapWidth,sizepCrab2, ovr11, ccounter);
[xpCrab3, ypCrab3, thetapCrab3, paraCrab3Graphics, pCrab3Alive, dpStep12, ovr12, ccounter] = runParaCrab(xCapt,yCapt,xpCrab3,ypCrab3,pCrab3Alive,paraCrab3Graphics,thetapCrab3,dpStep12,mapHeight,mapWidth,sizepCrab3, ovr12, ccounter);

%Keyboard interactions
    if (cmd == "w" || cmd == "a" || cmd == "s" || cmd == "d")

      if ~isempty(captainGraphics)
        delete(captainGraphics);
      endif

      %move captain
      [xCapt, yCapt, thetaCapt] = moveCaptain(cmd, xCapt, yCapt, thetaCapt, dStep, mapHeight, mapWidth);

      %draw new captain
      captainGraphics = drawCapt(xCapt, yCapt, thetaCapt, sizeCapt);

  endif

%Counting lives
%Lives reduce if captain collides with fish, end game at 3 lives
if (lives > 0) && (c1alive || c2alive || c3alive || pCrab1Alive || pCrab2Alive || pCrab3Alive)
  ccounter;
  title(['Lives ' num2str(lives) '           Number of presses: ' num2str(counter) '           Crabs collected ' num2str(ccounter) '/6']);
else if (lives > 0 )
  fprintf('You Win! You had %d presses\n', counter);
  break
else
  fprintf('You Lose! You had %d presses\n', counter');
  break
endif

endif

endwhile

close all

endfunction

