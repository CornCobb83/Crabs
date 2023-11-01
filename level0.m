function [words, level, lives, numCrabs, numFish, numParaCrabs, numSharks, cmd] = level0 ()

level = 0;
lives = 5;
step = 50;
words = 'null';

numFish = 0;
numCrabs = 0;
numParaCrabs = 0;
numSharks = 0;

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

endfunction
