function [carMatrix,IDs] = handleNewRoute(newRouteMatrix,carMatrix)
nodes = [1,-1,1;2,0,1;3,1,1;
        4,-1,0;5,0,0;6,1,0;
        7,-1,-1;8,0,-1;9,1,-1];
edges = [1,1,2;2,1,4;3,3,2;4,3,6;
        5,7,4;6,7,8;7,9,6;8,9,8;
        9,5,2;10,5,4;11,5,6;12,5,8];
    
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

dijkstraFinalArea = 0;
newSequence = 0;
seq =0;
x=[];
newNodes=[];
newEdges = [];
IDs = [];
dim = size(newRouteMatrix);

for i = 1: dim(1)
    if isequal(newRouteMatrix(i,:),[0,0])
        continue;
    end
    currArea=carMatrix(i,11);
    len = max(ceil(log10(abs(carMatrix(i,17))+1)),1);
    nextArea=floor(carMatrix(i,17)/10^(len-1));
    for j =1:4
       if( isequal(gatePoints(nextArea,[j*2-1,j*2]),newRouteMatrix(i,:)))
           dijkstraFinalArea=gateDirections(j);
           break;
       end
    end
    
%     dijkstra final dest.
%     for k = 1:length(nodes)
%         if nodes(k,1)==nextArea
%             continue;
%         end
%         newNodes = [newNodes;nodes(k)]; 
%     end
    newNodes = nodes;
    newNodes(newNodes(:, 1)== nextArea, :)= [];
    
%    for k = 1:length(edges)
%        if edges(k,2)==nextArea|| edges(k,3)==nextArea
%             continue;
%        end
%        newEdges = [newEdges;edges(k)]; 
%    end 
    newEdges = edges;
    newEdges(newEdges(:, 2)== nextArea, :)= [];
    newEdges(newEdges(:, 3)== nextArea, :)= [];
    disp(newNodes);
  
   [~,x] =   dijkstra(newNodes,newEdges,currArea,dijkstraFinalArea);
%    seq = str2double(char(x + '0'));
%    newSequence = seq*10+nextArea;
%    carMatrix(i,17)=newSequence;
%    carMatrix(i,[9,10])= newRouteMatrix(i,:);
%    IDs = [IDs,i];
end
end

