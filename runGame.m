function play ()

level = 0;
lives = 5;
step = 50;
words = 'null';

numFish = 0;
numCrabs = 0;
numParaCrabs = 0;
numSharks = 0;

while (level < 11 && level >= 0 && lives > 0)

%Level 1
if (level == 1)
numFish = 1;
numCrabs = 1;
numParaCrabs = 0;
numSharks = 0;
endif

%level 2
if (level == 2)
numFish = 2;
numCrabs = 1;
numParaCrabs = 0;
numSharks = 0;
endif

%Level 3
if (level == 3)
numFish = 3;
numCrabs = 0;
numParaCrabs = 1;
numSharks = 0;
endif

%Level 4
if (level == 4)
numFish = 3;
numCrabs = 2;
numParaCrabs = 1;
numSharks = 0;
endif

%Level 5
if (level == 5)
numFish = 3;
numCrabs = 3;
numParaCrabs = 3;
numSharks = 0;
endif

%Level 6
if (level == 6)
numFish = 0;
numCrabs = 0;
numParaCrabs = 2;
numSharks = 1;
endif

%Level 7
if (level == 7)
numFish = 0;
numCrabs = 0;
numParaCrabs = 3;
numSharks = 2;
endif

%Level 8
if (level == 8)
numFish = 1;
numCrabs = 2;
numParaCrabs = 2;
numSharks = 2;
endif

%Level 9
if (level == 9)
numFish = 2;
numCrabs = 3;
numParaCrabs = 3;
numSharks = 2;
endif

[lives, step, words, level, numFish, numCrabs, numParaCrabs, numSharks] = crabs (level, lives, step, words, numFish, numCrabs, numParaCrabs, numSharks);

if (level < 0)
  break
elseif (level != 10)
  level += 1;
endif

endwhile

clear
clearAllMemoizedCaches
clearvars
close all

%clears command window after x seconds
pause(0)
clc

endfunction
