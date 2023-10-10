function [xpCrab, ypCrab, thetapCrab, paraCrabGraph, pCrabAlive, dpStepC, ovr, ccounter] = runParaCrab(xC,yC,xpCrab,ypCrab,pCrabAlive,paraCrabGraph,thetapCrab,dpStepC,mapH,mapW,psize, ovr, ccounter)

pCrabAlive = alive(xC, yC, xpCrab, ypCrab, pCrabAlive, ovr);
if (pCrabAlive)

    if isgraphics(paraCrabGraph)
      delete(paraCrabGraph);
    endif

    %move crab
    [xpCrab, ypCrab, dpStepC] = moveParaCrab(xpCrab, ypCrab, dpStepC, mapH);

    %draw new crab
    paraCrabGraph = drawParaCrab(xpCrab, ypCrab, thetapCrab, psize);
elseif (!pCrabAlive && ovr)
    for (i = 1 : length(paraCrabGraph))
       set(paraCrabGraph(i), 'Visible', "off");
    endfor

    ovr = false;
    ccounter += 1;
else
    ovr = false;

endif
endfunction
