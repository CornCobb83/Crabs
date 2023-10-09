function [xCrab, yCrab, thetaCrab, crabGraph, crabAlive] = runCrab(xC,yC,xCrab,yCrab,crabAlive,crabGraph,thetaCrab,dStepC,mapH,mapW,size)
  if (crabAlive)
    crabAlive = alive(xC, yC, xCrab, yCrab, crabAlive);

    for (i = 1 : length(crabGraph))
       set(crabGraph(i), 'Visible', "off");
    endfor

    %move crab

    [xCrab, yCrab, thetaCrab] = moveCrab(xCrab, yCrab, thetaCrab, dStepC, mapH, mapW);

    %draw new crab
    crabGraph = drawCrab(xCrab, yCrab, thetaCrab, size);
else
    for (i = 1 : length(crabGraph))
       set(crabGraph(i), 'Visible', "off");
    endfor

endif
endfunction
