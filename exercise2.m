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

indNodBottom = find(nodes(:,2) < 0.01);
indNodEq = setdiff(indNodBd,indNodBottom);
indNodRL = find(nodes(:,1) > 4.01 | nodes(:,1) < 1.99);
indNodEq = setdiff(indNodEq,indNodRL);

plot(nodes(indNodEq,1),nodes(indNodEq,2),'dm')
hold off