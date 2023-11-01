function [check, lives] = printTo (level, lives, words, numCrabs, numParaCrabs, crabsAlive, paraCrabsAlive, mapHeight, mapWidth)

check = true;

if (lives > 0) && (crabsAlive > 0 || paraCrabsAlive > 0)
  if (level != 10)
    title([words '           Lives ' num2str(lives) '           Level: ' num2str(level) '           Crabs collected ' num2str((numCrabs + numParaCrabs) - crabsAlive - paraCrabsAlive) '/' num2str(numCrabs + numParaCrabs)], 'FontSize', 30);
  else
    title([words '           Lives ' num2str(lives) '           CUSTOM           Crabs collected ' num2str((numCrabs + numParaCrabs) - crabsAlive - paraCrabsAlive) '/' num2str(numCrabs + numParaCrabs)], 'FontSize', 30);
  endif
elseif (lives > 0 && level == 10)
  title(['Custom level - ' words], 'FontSize', 30);
  WordText1 = text(mapWidth/2.5, mapHeight/2, strcat('You Win!!'), 'FontSize', 48, 'Color', 'k');
  WordText2 = text(mapWidth/2, mapHeight/1.75, strcat('Lives: ', num2str(lives)), 'FontSize', 16, 'Color', 'k');
  pause(5);
  level += 1;
  check = false;
elseif (lives > 0 && level != 9)
  title(['Difficulty: ' words], 'FontSize', 30);
  WordText1 = text(mapWidth/3, mapHeight/2, strcat('Level ', num2str(level), ' complete!'), 'FontSize', 36, 'Color', 'k');
  WordText2 = text(mapWidth/2, mapHeight/1.75, strcat('Lives: ', num2str(lives)), 'FontSize', 16, 'Color', 'k');
  pause(3);
  delete(WordText1);
  delete(WordText2);
  check = false;
elseif (lives > 0 && level == 9)
  title(['Difficulty: ' words], 'FontSize', 30);
  WordText1 = text(mapWidth/2.5, mapHeight/2, strcat('You Win!!'), 'FontSize', 48, 'Color', 'k');
  WordText2 = text(mapWidth/2, mapHeight/1.75, strcat('Lives: ', num2str(lives)), 'FontSize', 16, 'Color', 'k');
  pause(5);
  level = 11;
  check = false;
else
  if (level != 10)
    title(['Difficulty: ' words], 'FontSize', 30);
    WordText1 = text(mapWidth/2.5, mapHeight/2, strcat('Game Over'), 'FontSize', 48, 'Color', 'k');
    WordText2 = text(mapWidth/2, mapHeight/1.75, strcat('Level: ', num2str(level)), 'FontSize', 16, 'Color', 'k');
    pause(5);
  else
  title(['Custom level - ' words], 'FontSize', 30);
  WordText1 = text(mapWidth/2.5, mapHeight/2, strcat('You Lose'), 'FontSize', 48, 'Color', 'k');
  pause(5);
  level += 1;
  endif
  check = false;
endif

endfunction
