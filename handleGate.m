function [admittedCar,newGateQueue,newRoute] = handleGate(areaBoundaries,gateIndex,gatePoints,gateQueue,carPollutions,enteringCar,area,threshold,isReroute)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
newRoute=[-10,-10]; %invalid number
ID = enteringCar(1);
emergency = enteringCar(2);
finalPoint = eneringCar(3,4);
avgSpeed = area(1);
areaPollution = area(2);
newGate=gatePoints(gateIndex,:);
admittedCar=-1;


if emergency ==1 
    admittedCar = ID;
    newGateQueue = gateQueue;
elseif carPollutions(ID)*avgSpeed < threshold
    if isReroute ==1
        newGate=getClosestGate(finalPoint,areaBoundaries,gatePoints);
    end
    if isequal(newGate,gatePoints(gateIndex,:))
        newGateQueue = gateQueue*100+ID ; %append to the right
    else
%         Change route
          newRoute=newGate;
    end
    len=length(char(""+newGateQueue));
    %popping
    if newGateQueue > 0 
        if mod(len,2)==0
            popID = floor(newGateQueue/10^(len-2));
            if pollutions(popID)*avgSpeed + areaPollution <= threshold
                admittedCar = popID;
                newGateQueue = newGateQueue - popID*10^(len-2);
            end
        else
            popID = floor(newGateQueue/10^(len-1));
            if pollutions(popID)*avgSpeed + areaPollution <= threshold
                admittedCar = popID;
                newGateQueue = newGateQueue - popID*10^(len-1);
            end
        end
    end
    
end
end

