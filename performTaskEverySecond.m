function [xCrab1, yCrab1, thetaCrab1] = performTaskEverySecond(x , y, theta)
    while true
        xCrab1 = x;
        yCrab1 = y;
        thetaCrab1 = theta;

        moveCrab(x, y, theta);

        % Pause for one second
        pause(1);
    end
end
