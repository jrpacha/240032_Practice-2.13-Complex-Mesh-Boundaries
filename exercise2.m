clearvars
close all

clearvars 
close all

eval('meshUTriang');
[numElem, ndim] = size(elem);

figure()
plotElements(nodes,elem,0);
hold on
%%

[indNodBd,indElemBd,indLocalEdgeBd,edges]=boundaryNodes(nodes,elem);

indNodLeft = find(nodes(:,1) < 0.01);
indNodEq = setdiff(indNodBd,indNodLeft);
indNodRight = find(nodes(:,1) > 5.99);
indNodEq = setdiff(indNodEq,indNodRight);
indNodBott = find(nodes(:,2) < 0.01);
indNodEq = setdiff(indNodEq,indNodBott);
indNodTopR = find(nodes(:,1) > 4.01);
indNodEq = setdiff(indNodEq,indNodTopR);
indNodTopL = find(nodes(:,1) < 1.99);
indNodEq = setdiff(indNodEq,indNodTopL);

plot(nodes(indNodEq,1),nodes(indNodEq,2),'dm')
hold off