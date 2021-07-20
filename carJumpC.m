function [carPlus,enteringID] = carJumpC(car)
%UNTITLED Summary of this function goes here
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

avgHorn =0.5;

enteringID = 0;
enteringFinalPointX = 0;
enteringFinalPointY =0;
enteringEmergency = 0;
pendingPlus=pending;
noisePlus = noise;
speedPlus=speed;
carOnPlus= carOn;
hornPlus=horn;
enteredPlus =entered;

if abs(finalTargetX -currLocX)<0.1   && abs(finalTargetY-currLocY)<0.1 && entered ~=1
    carOnPlus = 0;
    speedPlus = 0;
    enteredPlus =1;
elseif (abs(currTargetX - currLocX)< 0.15  && abs(currTargetY - currLocY)< 0.15) && pending ==0
    pendingPlus =1 ;
    enteringID = RFID;
    carOnPlus = 0;
    speedPlus =0;
elseif horn==1
    hornPlus =0;
    noisePlus=noise-hornNoise;
elseif rand(1)<=  avgHorn
    hornPlus = 1;
    noisePlus=noise+hornNoise;
end
carPlus = [RFID;pollKm;noisePlus;hornNoise;finalTargetX;finalTargetY;currLocX;currLocY;currTargetX;currTargetY;currArea;speedPlus;carOnPlus;pendingPlus;hornPlus;enteredPlus;sequence;emergency];
end


