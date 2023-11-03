function [level, check] = printTo (level, lives, words, numCrabs, numParaCrabs, crabsAlive, paraCrabsAlive, mapHeight, mapWidth, xCapt, yCapt, thetaCapt, sizeCapt, captainGraphics)

check = true;

if (level > -5)
if (lives > 0) && (crabsAlive > 0 || paraCrabsAlive > 0)
  if (level != 10)
    title([words '           Lives ' num2str(lives) '           Level: ' num2str(level) '           Crabs collected ' num2str((numCrabs + numParaCrabs) - crabsAlive - paraCrabsAlive) '/' num2str(numCrabs + numParaCrabs)], 'FontSize', 30);
  else
    title([words '           Lives ' num2str(lives) '           CUSTOM           Crabs collected ' num2str((numCrabs + numParaCrabs) - crabsAlive - paraCrabsAlive) '/' num2str(numCrabs + numParaCrabs)], 'FontSize', 30);
  endif

elseif (lives > 0 && level == 10)
  title(['Custom level - ' words], 'FontSize', 30);
  WordText1 = text(mapWidth/2.5, mapHeight/2, strcat('You Win!!'), 'FontSize', 48, 'Color', 'r');
  WordText2 = text(mapWidth/2, mapHeight/1.75, strcat('Lives: ', num2str(lives)), 'FontSize', 16, 'Color', 'r');
  for (i = 1:30)
    delete(captainGraphics);
    [xNet, yNet, captainGraphics] = drawCapt (xCapt, yCapt, thetaCapt, sizeCapt);
    pause(0.05);
    thetaCapt += (pi/6);
  endfor
  level = 0;
  check = false;
  delete(WordText1);
  delete(WordText2);
  title([''], 'FontSize', 30);

elseif (lives > 0 && level != 9)
  title(['Difficulty: ' words], 'FontSize', 30);
  WordText1 = text(mapWidth/3, mapHeight/2, strcat('Level ', num2str(level), ' complete!'), 'FontSize', 36, 'Color', 'r');
  WordText2 = text(mapWidth/2, mapHeight/1.75, strcat('Lives: ', num2str(lives)), 'FontSize', 16, 'Color', 'r');
    for (i = 1:10)
    delete(captainGraphics);
    [xNet, yNet, captainGraphics] = drawCapt (xCapt, yCapt, thetaCapt, sizeCapt);
    pause(0.1);
    thetaCapt += (pi/6);
  endfor
  delete(WordText1);
  delete(WordText2);
  title([''], 'FontSize', 30);
  check = false;

elseif (lives > 0 && level == 9)
  title(['Difficulty: ' words], 'FontSize', 30);
  WordText1 = text(mapWidth/2.5, mapHeight/2, strcat('You Win!!'), 'FontSize', 48, 'Color', 'r');
  WordText2 = text(mapWidth/2, mapHeight/1.75, strcat('Lives: ', num2str(lives)), 'FontSize', 16, 'Color', 'r');
  for (i = 1:30)
    delete(captainGraphics);
    [xNet, yNet, captainGraphics] = drawCapt (xCapt, yCapt, thetaCapt, sizeCapt);
    pause(0.05);
    thetaCapt += (pi/6);
  endfor
  delete(WordText1);
  delete(WordText2);
  title([''], 'FontSize', 30);
  level = 0;
  check = false;

else
  if (level != 10)
    title(['Difficulty: ' words], 'FontSize', 30);
    WordText1 = text(mapWidth/2.5, mapHeight/2, strcat('Game Over'), 'FontSize', 48, 'Color', 'r');
    WordText2 = text(mapWidth/2, mapHeight/1.75, strcat('Level: ', num2str(level)), 'FontSize', 16, 'Color', 'r');
    pause(5);
    level = 0;
  delete(WordText1);
  delete(WordText2);
  title([''], 'FontSize', 30);


  else
    title(['Custom level - ' words], 'FontSize', 30);
    WordText1 = text(mapWidth/2.5, mapHeight/2, strcat('You Lose'), 'FontSize', 48, 'Color', 'r');
    pause(5);
    level = 0;
  delete(WordText1);
  title([''], 'FontSize', 30);

  endif

  check = false;

  endif
endif

endfunction
