function [carMatrix,IDs] = handleAdmit(carsAdmitted,carMatrix)

gatePoints = [100,100,100,100,-0.5,1,-1,0.5;
              -0.5,1,100,100,0.5,1,0,0.5;
              0.5,1,100,100,100,100,1,0.5;
            100,100,-1,0.5,-0.5,0,-1,-0.5;
            -0.5,0,0,0.5,0.5,0,0,-0.5;
            0.5,0,1,0.5,100,100,1,-0.5;
            100,100,-1,-0.5,-0.5,-1,100,100;
            -0.5,-1,0,-0.5,0.5,-1,100,100;
            0.5,-1,1,-0.5,100,100,100,100];
gateDirections = [0,0,2,4;1,0,3,5;2,0,0,6;0,1,5,7;4,2,6,8;5,3,0,9;0,4,8,0;7,5,9,0;8,6,0,0];
dim = size(carMatrix);
IDs = zeros(dim(1),1);
for i = 1:length(carsAdmitted)
    if carsAdmitted(i)==0
        continue;
    end
    
%    popping the current area from the sequence
    len = max(ceil(log10(abs(carMatrix(i,17))+1)),1);
    carMatrix(i,11)=floor(carMatrix(i,17)/10^(len-1));
    carMatrix(i,17)= carMatrix(i,17) - carMatrix(i,11)*10^(len-1);
    IDs(i) = 1;
%   the car in the final area
    if carMatrix(i,17)==0
        carMatrix(i,[9,10])=carMatrix(i,[5,6]);
    else
%         next target is the next gate
        nextArea = floor(carMatrix(i,17)/10^(len-2));
      
        for j = 1:4
            if gateDirections(carMatrix(i,11),j)==nextArea
                gateDirectionPoints=reshape(gatePoints(carMatrix(i,11),:),2,4)';
                carMatrix(i,[9,10])=gateDirectionPoints(j,:);
                 
                break;
%                 carMatrix(i,[9,10])=gatePoints(carMatrix(i,11),[j*2-1,j*2]);
            end
        end
    end
end

