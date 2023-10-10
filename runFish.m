function [xFish, yFish, thetaFish, fishGraph, fishAlive, ovr, lives] = runFish(xF,yF,xFish,yFish,fishAlive,fishGraph,thetaFish,dStepF,mapH,mapW,size, ovr, lives)

fishAlive = alive(xF, yF, xFish, yFish, fishAlive, ovr);
if (fishAlive)

    if isgraphics(fishGraph)
      delete(fishGraph);
    endif

    %move fish
    [xFish, yFish, thetaFish] = moveFish(xFish, yFish, thetaFish, dStepF, mapH, mapW);

    %draw new fish
    fishGraph = drawFish(xFish, yFish, thetaFish, size);
elseif (!fishAlive && ovr)
    for (i = 1 : length(fishGraph))
       set(fishGraph(i), 'Visible', "off");
    endfor

    ovr = false;
    lives -= 1;
else
    ovr = false;

endif
endfunction
