function [xFish, yFish, thetaFish, fishGraph, fishAlive, ovr, lives] = runShark(xF,yF,xFish,yFish,fishAlive,fishGraph,thetaFish,dStepF,mapH,mapW,size, ovr, lives)

dist = 250;

fishAlive = alive(xF, yF, xFish, yFish, fishAlive, ovr, dist);

if (iscell(fishAlive))
  fishAlive = cell2mat(fishAlive);
endif
if (iscell(ovr))
  ovr = cell2mat(ovr);
endif

if (fishAlive)

    if isgraphics(fishGraph)
      delete(fishGraph);
    endif

    %move fish
    [xFish, yFish, thetaFish] = moveShark(xFish, yFish, thetaFish, dStepF, mapH, mapW);

    %draw new fish
    fishGraph = drawShark(xFish, yFish, thetaFish, size);

elseif (fishAlive == false && ovr == true)
    if isgraphics(fishGraph)
      delete(fishGraph);
    endif

    ovr = false;
    lives -= 2;

else
    ovr = false;

endif

endfunction
