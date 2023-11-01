function [xCrab, yCrab, thetaCrab, crabGraph, sizeCrab, dStepC, crabAlive, ovr, crabsAlive] = runCrab(xC,yC,xCrab,yCrab,crabAlive,crabGraph,thetaCrab,dStepC,mapH,mapW,sizeCrab,ovr,xNet,yNet,crabsAlive)

crabAlive = aliveCrab(xC, yC, thetaCrab, xCrab, yCrab, crabAlive, ovr, xNet, yNet);

if (crabAlive)

    if isgraphics(crabGraph)
      delete(crabGraph);
    endif

    %move crab
    [xCrab, yCrab, dStepC] = moveCrab(xCrab, yCrab, dStepC, mapW);

    %draw new crab
    crabGraph = drawCrab(xCrab, yCrab, thetaCrab, sizeCrab);

elseif (crabAlive == false && ovr == true)
    if isgraphics(crabGraph)
      delete(crabGraph);
    endif

    ovr = false;
    crabsAlive -= 1;
else
    ovr = false;

endif
endfunction
