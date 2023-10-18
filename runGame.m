function runGame ()

level = 0;
lives = 5;
step = 50;
words = 'null';

while (level < 6 && lives > 0)
[lives, step, words] = crabs(level, lives, step, words);
level += 1;
endwhile

close all

endfunction
