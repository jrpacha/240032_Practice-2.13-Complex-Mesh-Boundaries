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
indBotLeft = find(nodes(:,2) < 0.01 | nodes(:,1) <0.01);
indCirc = setdiff(indCirc,indBotLeft);
indEq = setdiff(indNodBd,indCirc);
indLeftBot = find(nodes(:,2) < 30.01 & nodes(:,1) < 10.0);
indEq = setdiff(indEq,indLeftBot);
indRightBot = find(nodes(:,2) < 5.01 & nodes(:,1) < 30.01);
indEq = setdiff(indEq,indRightBot);

plot(nodes(indEq,1),nodes(indEq,2),'dm')
hold off

%Plot the contour and the selected nodes
figure()
for i=1:size(indElemBd,1)
    nod1 = indLocalEdgeBd(i);
    nod2 = nod1 + 1;
    if (ndim == 3)
        if (nod1 == 3)
            nod2 = 1;
        end
    elseif (ndim == 4)
        if (nod1 == 4)
            nod2 = 1;
        end
    end
    v1=nodes(elem(indElemBd(i),nod1),:);
    v2=nodes(elem(indElemBd(i),nod2),:);
    X=[v1(1);v2(1)];
    Y=[v1(2);v2(2)];
    plot(X,Y,'b-')
    hold on
end
axis equal
plot(nodes(indEq,1),nodes(indEq,2),'go')
hold off