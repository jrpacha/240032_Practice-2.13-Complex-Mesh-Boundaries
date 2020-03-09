clearvars 
close all

eval('meshDataHoleS5');
[numElem, ndim] = size(elem);

figure()

plotElements(nodes, elem, 0);
% only for testing purposes DO NOT USE THIS ------------------------------
%[indNodBd,indElemBd,indLocalEdgeBd,edges]=myBoundaryNodes(nodes,elem); 
% ------------------------------------------------------------------------

[indNodBd,indElemBd,indLocalEdgeBd,edges]=boundaryNodes(nodes,elem);

hold on
for i=1:length(indElemBd)
    fill(nodes(elem(indElemBd(i),:),1),nodes(elem(indElemBd(i),:),2),'y');
end
plot(nodes(indNodBd,1),nodes(indNodBd,2),'o','Marker','o',...
    'MarkerFaceColor','red','MarkerEdgeColor','black')
hold off

% Plot only the corresponding edges of the boundary elements
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
    plot(X,Y,'-m')
    hold on
end
axis equal
hold off

%Only part of the boundary
indLeft=find(nodes(:,1) < 0.001);
indCircle=find(((nodes(:,1)-4).^2+(nodes(:,2)-1).^2-0.25)<0.01);
indEqual=setdiff(indNodBd,indLeft);
indEqual=setdiff(indEqual,indCircle);

figure()
plot(nodes(indLeft,1),nodes(indLeft,2),'ro') 
hold on
plot(nodes(indCircle,1),nodes(indCircle,2),'bo')
plot(nodes(indEqual,1),nodes(indEqual,2),'gs')
axis equal
hold off

    