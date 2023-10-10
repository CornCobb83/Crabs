function [height,width] = drawMap(imageName, counter)
%This function draws the background map for the game using the image named imageName
% It returns the map dimensions base in the supplied image.

% The size of the background image defines the map dimesions of the game and establishes the coordinate system.
% Thus the game coordinates are x increasing to the right and y increasing downward with the origin at the upper left corner.

%clear any current figures
clf

%create game figure
figure(1);

%read background image and get its size
img = imread(imageName);
[height,width] = size(img);

%display background image in figure(1)
imshow(imageName);

%put a title on the figure
%title(['Lives             Level:             Crabs collected 0/ '], 'FontSize', 20);

%keep the background and plot on top of it
hold on

endfunction
