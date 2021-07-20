function [carDot] = handleCar(car,maxSpeed,avgSpeed)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

RFID = car(1);
pollKm = car(2);
noise = car(3);
hornNoise = car(4);
finalTargetX = car(5);
finalTargetY = car(6);
currLocX = car(7);
currLocY = car(8);
currTargetX = car(9);
currTargetY = car(10);
currArea = car(11);
speed = car(12);
carOn = car(13);
pending = car(14);
horn = car(15);
entered = car(16);
sequence = car(17);

noiseDot = noise*speed;
currLocDot = [0;0];
    
speedDot = 0;

if(carOn==1)
    acc = (maxSpeed(currArea)/4)*(rand(1)*2-1);
    directionX = currTargetX - currLocX ;
    directionY = currTargetY - currLocY ;
    normalizedDirection = [directionX;directionY].*(1/sqrt(directionX^2+directionY^2));
    disp(speed);
    distance=sqrt(sum(([currLocX,currLocY]-[currTargetX,currTargetY]).^2));
    speedDot=avgSpeed(currArea)-speed+acc;
    if speed >maxSpeed(currArea)
        speedDot =1-speed;
        speed = 1;
    end
    if speed <0
        speedDot=1-speed;
        speed = 1;
    end
    
    currLocDot = normalizedDirection.*speed;

%     currLocDot = normalizedDirection.*1;
%     speedDot=1-speed;
    
%     acc = 10*(speed+acc-1);
    
%     while acc+speed > maxSpeed(currArea) || acc+speed <0
%         acc = 5*(rand(1)*2-1);
%     end

%     if acc/10+speed < 0 
%         acc = 1;
%     end
%     if acc/10+speed > maxSpeed(currArea)
%         acc =-1;
%     end
%     if speed<0
%         acc =10;
%     end
%     if speed > maxSpeed(currArea)
%         acc =-10;
%     end
%     
%         speedDot = acc;

    
    
%     if distance<0.15
%         speedDot=(0.1-speed);
%     end
    disp([distance,speed,speedDot]);
end
    
    carDot = [0;0;noiseDot;0;0;0;currLocDot;0;0;0;speedDot;0;0;0;0;0;0];

end

