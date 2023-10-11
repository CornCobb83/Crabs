function [xCrab, yCrab, thetaCrab, crabGraph, crabAlive, dStepC, ovr, ccounter] = runCrab(xC,yC,xCrab,yCrab,crabAlive,crabGraph,thetaCrab,dStepC,mapH,mapW,size, ovr, ccounter)

crabAlive = alive(xC, yC, xCrab, yCrab, crabAlive, ovr);
if (crabAlive)

    if isgraphics(crabGraph)
      delete(crabGraph);
    endif

    %move crab
    [xCrab, yCrab, dStepC] = moveCrab(xCrab, yCrab, dStepC, mapW);

    %draw new crab
    crabGraph = drawCrab(xCrab, yCrab, thetaCrab, size);
elseif (!crabAlive && ovr)
    if isgraphics(crabGraph)
      delete(crabGraph);
    endif

    ovr = false;
    ccounter += 1;
else
    ovr = false;

endif
endfunction
