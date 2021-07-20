function [areaDot] = handleArea(neighboringAreas,area,cars,weather)
dissipation = neighboringAreas;
currPollution = area(1);
currNoise = area(2);
carPollutions = cars(:,1);
noisePollutions = cars(:,2);




c = weather(1)*weather(2);
gasPollutionDot = c*( sum(dissipation)-5*currPollution) + sum(carPollutions);
noisePollutionDot = 0.1*(sum(noisePollutions)- currNoise);

if sum(noisePollutions) ==0
    noisePollutionDot = -currNoise;
end

if currNoise+noisePollutionDot <= 0 
    noisePollutionDot = - currNoise;
end

if currPollution+gasPollutionDot <= 0
    gasPollutionDot = -currPollution;
end
areaDot = [gasPollutionDot;noisePollutionDot];
end

