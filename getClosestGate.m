function [closestGate] = getClosestGate(finalPoint,areaBoundaries,gatePoints)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    closestGate = [100,100];

if finalPoint(1) <  areaBoundaries(1) && finalPoint(1) >  areaBoundaries(3) && finalPoint(2) <  areaBoundaries(2) && finalPoint(2) >  areaBoundaries(4) 
    
    closestDistance = sqrt(2);
    for i = 1:length(gatePoints)
        temp=closestDistance;
        closestDistance = min(closestDistance,sqrt((gatePoints(i,1)-finalPoint(1))^2+(gatePoints(i,2)-finalPoint(2))^2));
        if(closestDistance<temp)
            closestGate=gatePoints(i,:);
        end
    end
    
end

end

