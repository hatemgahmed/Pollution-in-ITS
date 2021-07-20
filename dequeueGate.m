function [admittedCar,newGateQueue] = dequeueGate(gateQueue,carAttributes,area,threshold)
carPollutions = carAttributes(:,2);
carEmergencies = carAttributes(:,1);

avgSpeed = area(1);
areaPollution = area(2);
admittedCar= -1;

% len=length(char(""+gateQueue));
len = max(ceil(log10(abs(gateQueue)+1)),1);

newGateQueue = gateQueue;
if gateQueue>0.5
    if mod(len,2)==0
        carID = floor(gateQueue/10^(len-2));
        
        if carEmergencies(carID)==1 || carPollutions(carID)*avgSpeed + areaPollution <= threshold
            admittedCar = carID;
            newGateQueue = gateQueue - carID*10^(len-2);
        end
    else
        carID = floor(gateQueue/10^(len-1));
        
        if carEmergencies(carID)==1 || carPollutions(carID)*avgSpeed + areaPollution <= threshold
            admittedCar = carID;
            newGateQueue = gateQueue - carID*10^(len-1);
        end
    end
end
end

