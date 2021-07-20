function [dissipations] = getDissipation(neighboring,pollutions)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

dissipations = zeros(9,4);

for i = 1:9
    for j = 1:4
        if(neighboring(i,j)>0)
            dissipations(i,j) = pollutions(neighboring(i,j));
        end
    end
end
end

