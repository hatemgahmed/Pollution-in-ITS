function [pollutions] = getSumPollutions(carMatrix)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
pollutions=zeros(9,2);
rows = size(carMatrix);
for i = 1:rows(1)
    if(carMatrix(i,1)>0)
        pollutions(carMatrix(i,1),1)=pollutions(carMatrix(i,1),1)+carMatrix(i,2)*carMatrix(i,3); 
        pollutions(carMatrix(i,1),2)=pollutions(carMatrix(i,1),2)+carMatrix(i,4);
        
    end
end
end