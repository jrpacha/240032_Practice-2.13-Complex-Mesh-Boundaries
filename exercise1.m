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

idBott = find(nodes(:,2) < 0.001);
idOtherBd = setdiff(indNodBd,idBott);
plot(nodes(idOtherBd,1),nodes(idOtherBd,2),'dm')
hold off