function [newGateQueue,newRoute] = enqueueGate(areaBoundaries,gateIndex,gatePoints,gateQueue,carPollutions,enteringCar,area,threshold,isReroute)

newRoute=[0,0]; %invalid number
ID = enteringCar(1);
emergency = enteringCar(2);
finalPoint = enteringCar([3,4]);
avgSpeed = area(1);

newGate=gatePoints(gateIndex,:);
newGateQueue = gateQueue;
if emergency ==1 
    l = max(ceil(log10(abs(gateQueue)+1)),1);
%     l=length(char(""+gateQueue));
    if mod(l,2)==0
        newGateQueue = gateQueue + ID*10^(l);
    else
        newGateQueue = gateQueue + ID*10^(l+1);
    end
elseif carPollutions(ID)*avgSpeed < threshold
    if isReroute ==1
        newGate=getClosestGate(finalPoint,areaBoundaries,gatePoints);
    end
    if isequal(newGate,gatePoints(gateIndex,:)) || isequal(newGate,[100,100])
        newGateQueue = gateQueue*100+ID ; %append to the right
    else
%         Change route
          newRoute=newGate;
    end
end

