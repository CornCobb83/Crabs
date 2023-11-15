Function: crabs: ->  <br>
Purpose: Main function of program, calls all functions, declares values of x, y, theta, size, and dStep for all plotted ojects(captain, crab, fish). Uses functions to plot all objects, move captain, fish, and crab accordingly, and have crabs go invisible accordingly, test. <br>
Dependencies: ALL OF THE FOLLOWING <br>
Call: crabs() <br>
Side Effects: Runs entire game. <br>
<br>
<br>
Function: drawLine: vector-> handle <br>
Purpose: Function draws line between two points in the matrix created in function getCapt. <br>
Dependencies: depends on octaves plot function <br>
Call: handle = drawLine <br>
Side Effects: Draws a line on the plot between the two points <br>
<br>
<br>
Function: drawMap: imageName, counter->(height,width)  <br>
Purpose: Plots the image as a background of all future plotted objects. <br>
Dependencies: octave's size function <br>
Call: (height,width) = drawMap <br>
Side Effects: The background image appears on screen. <br>
<br>
<br>
Function: getCapt: size->capt=[captPt1, ... captPt14]  <br>
Purpose: To create a matrix containing all points of the captains body. <br>
Dependencies: None. <br>
Call: capt = getCapt <br>
Side Effects: None. <br>
<br>
<br>
Function: drawCapt: (xCapt, yCapt, thetaCapt, sizeCapt)-> captainGraphics  <br>
Purpose: To use drawLine to draw lines between every point in the capt matrix in the plot. Puts all connected points into a matrix captainGraphics. <br>
Dependencies: getCapt, getRotation, getTranslation, drawLine <br>
Call: captainGraphics = drawCapt() <br>
Side Effects: Captain appears on screen in the shape of all connected lines <br>
<br>
<br>
Function: getRotation: thetaCapt->R  <br>
Purpose: Creates a matrix of values that are multiplied by thetaCapt(the rotation of the captain) <br>
Dependencies: None. <br>
Call: R = getRotation() <br>
Side Effects: None. <br>
<br>
<br>
Function: getTranslation: (xCapt, yCapt)->T  <br>
Purpose: To create a matrix of values using xCapt and yCapt in their respective spaces <br>
Dependencies: None. <br>
Call: T=getTranslation()  <br>
Side Effects: None. <br>
<br>
<br>
Function: moveCaptain: (key, x, y, theta, dStep, height, width)->[xCapt, yCapt, thetaCapt]  <br>
Purpose: To make the captain react to key presses of w, a, s, and d. W causes the xCapt and yCapt to increase by dStep in the direction of theta A causes theta to descrease by dTheta. S causes xCaot and yCapt to decrease by dStep in the direction of theta. D causes theta to increase by dTheta. <br>
Dependencies: None. <br>
Call:  (xCapt, yCapt, thetaCapt)=moveCaptain()  <br>
Side Effects: Causes captain on screen to be in a different position than previously. <br>
<br>
<br>
Function: drawCrab: (xCrab, yCrab, thetaCrab, sizeCrab)-> crabGraphics  <br>
Purpose: To use drawLine to draw lines between every point in the crab matrix in the plot. Puts all connected points into a matrix crabGraphics. <br>
Dependencies: getCrab, getRotation, getTranslation, drawLine <br>
Call: crabGraphics = drawCrab() <br>
Side Effects: Crab appears on screen in the shape of all connected lines <br>
<br>
<br>
Function: getCrab: size->crab=[crabPt1, ... crabPt14]  <br>
Purpose: To create a matrix containing all points of the crabs body. <br>
Dependencies: None. <br>
Call: crab = getCrab <br>
Side Effects: None. <br>
<br>
<br>
Function: alive: (captX, captY, cX, cY, alive)->isAlive  <br>
Purpose: To continually test if the captain plotted object is at all in collision with the creature(Crab, fish, etc.) plotted object, and if it is, turns boolean variable isAlive(or alive in different instances) to false, true otherwise. <br>
Dependencies: None. <br>
Call:  isAlive=alive()  <br>
Side Effects: None. <br>
<br>
<br>
Function: getFish: size->fish=[fishPt1, ... fishPt14]  <br>
Purpose: To create a matrix containing all points of the fish's body. <br>
Dependencies: None. <br>
Call: fish = getFish <br>
Side Effects: None. <br>
<br>
<br>
Function: drawFish: (xFish, yFish, thetaFish, sizeFish)-> fishGraphics  <br>
Purpose: To use drawLine to draw lines between every point in the fish matrix in the plot. Puts all connected points into a matrix fishGraphics. <br>
Dependencies: getFish, getRotation, getTranslation, drawLine <br>
Call: fishGraphics = drawFish() <br>
Side Effects: Fish appears on screen in the shape of all connected lines <br>
<br>
<br>
Function: moveCrab: (x, y, theta, dStep, ehight, width)->[xCrab, yCrab, crabGraphics]  <br>
Purpose: To cause the plotted crab objects to move, xCrab and yCrab vlaues are changed so it moves "forward" continuously while they are alive. <br>
Dependencies: None. <br>
Call: [xCrab, yCrab, thetaCrab]=moveCrab  <br>
Side Effects: changes the position of all plotted  <br>
<br>
<br>
Function: runCrab: ->  <br>
Purpose: If the called crab is alive, it plots the graphics, then calls moveCrab to change the values of the crab, then calls drawCrab to new, increased values.  <br>
Dependencies: alive, moveCrab, drawCrab <br>
Call:  =  <br>
Side Effects:  <br>
<br>
<br>
Function: : ->  <br>
Purpose:  <br>
Dependencies:  <br>
Call:  =  <br>
Side Effects:  <br>
<br>
<br>
Function: : ->  <br>
Purpose:  <br>
Dependencies:  <br>
Call:  =  <br>
Side Effects:  <br>
<br>
<br>
Function: : ->  <br>
Purpose:  <br>
Dependencies:  <br>
Call:  =  <br>
Side Effects:  <br>
<br>
<br>
Function: : ->  <br>
Purpose:  <br>
Dependencies:  <br>
Call:  =  <br>
Side Effects:  <br>
<br>
<br>
