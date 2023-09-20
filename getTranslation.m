function T = getTranslation (xCapt, yCapt)

%This line of code creates and returns the Matrix that allows the captain to move
%It returns the matrix which is them multiplied by the captains current location

T = [1 0 xCapt; 0 1 yCapt; 0 0 1];

endfunction
