function [xpCrab, ypCrab, thetapCrab, paraCrabGraph, pCrabAlive, dpStepC, ovr, ccounter] = runParaCrab(xC,yC,thetaC,xpCrab,ypCrab,pCrabAlive,paraCrabGraph,thetapCrab,dpStepC,mapH,mapW,psize, ovr, ccounter, net)

pCrabAlive = aliveCrab(xC, yC,thetaC , xpCrab, ypCrab, pCrabAlive, ovr, net);
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
