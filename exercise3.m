clearvars
close all

clearvars 
close all

eval('meshClipQuad');
[numElem, ndim] = size(elem);

figure()
plotElements(nodes,elem,0);
hold on

%%
[indNodBd,indElemBd,indLocalEdgeBd,edges]=boundaryNodes(nodes,elem);

indCirc1 = find((nodes(:,1).^2 + nodes(:,2).^2)-1600 > -0.05);
indCirc2 = find((nodes(:,1).^2 + nodes(:,2).^2)-1600 > 0.05);
indCirc = setdiff(indCirc1,indCirc2);
indBot = find(nodes(:,2) < 0.01);
indCirc = setdiff(indCirc,indBot);
indRight = find(nodes(:,1) < 0.01);
indCirc = setdiff(indCirc,indRight);
indEq = setdiff(indNodBd,indCirc);
indLeftBot = find(nodes(:,2) < 30.01 & nodes(:,1) < 10.0);
indEq = setdiff(indEq,indLeftBot);
indRightBot = find(nodes(:,2) < 5.01 & nodes(:,1) < 30.01);
indEq = setdiff(indEq,indRightBot);

plot(nodes(indEq,1),nodes(indEq,2),'dm')
hold off