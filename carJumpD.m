function carPlus = carJumpD(car)
%UNTITLED4 Summary of this function goes here
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
emergency = car(18);


% change average horning
%TO DO (entered)
if(currTargetX==finalTargetX&&currTargetY==finalTargetY)
    if abs(finalTargetX -currLocX)<0.1   && abs(finalTargetY-currLocY)<0.1 && entered ~=1
        carPlus=1;
    else
        carPlus=0;
    end
elseif (abs(currTargetX - currLocX)< 0.15  && abs(currTargetY - currLocY)< 0.15) % || (finalTargetX == currLocX   && finalTargetY == currLocY ) || horn==1 || entered ==1
    carPlus =1;
    
else
    carPlus = 0;
    
end
end

