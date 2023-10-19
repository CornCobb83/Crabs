function [xpCrab, ypCrab, thetapCrab, paraCrabGraph, pCrabAlive, dpStepC, ovr, sc, paraCrabsAlive] = runParaCrab(xC,yC,thetaC,xpCrab,ypCrab,pCrabAlive,paraCrabGraph,thetapCrab,dpStepC,mapH,mapW,psize,ovr,xNet, yNet,sc, paraCrabsAlive)

pCrabAlive = aliveCrab(xC, yC,thetaC , xpCrab, ypCrab, pCrabAlive, ovr, xNet, yNet);

if (iscell(pCrabAlive))
  pCrabAlive = cell2mat(pCrabAlive);
endif
if (iscell(ovr))
  ovr = cell2mat(ovr);
endif

if (pCrabAlive)

    if isgraphics(paraCrabGraph)
      delete(paraCrabGraph);
    endif

    %move crab
    [xpCrab, ypCrab, dpStepC, thetapCrab, sc] = moveParaCrab(xpCrab, ypCrab, dpStepC, mapH, thetaC, sc);

    %draw new crab
    paraCrabGraph = drawParaCrab(xpCrab, ypCrab, thetapCrab, psize);

elseif (pCrabAlive == false && ovr == true)
    if isgraphics(paraCrabGraph)
      delete(paraCrabGraph);
    endif

    ovr = false;
    paraCrabsAlive -= 1;
else
    ovr = false;

endif
endfunction
