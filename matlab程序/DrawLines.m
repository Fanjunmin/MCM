function [  ] = DrawLines( tuple,G,position )
%UNTITLED15 此处显示有关此函数的摘要
%   此处显示详细说明
DrawG(G,position);
hold on;
length=size(tuple,2);
for i=1:length-12
    col=floor(i/length);
    pLength=size(tuple{i},2);
    for j=1:pLength-1
        x=tuple{i}(j);
        y=tuple{i}(j+1);
        plot([position(x,1),position(y,1)],[position(x,2),position(y,2)],'color','g');
        hold on;
    end
end
for i=13:length
    col=floor(i/length);
    pLength=size(tuple{i},2);
    for j=1:pLength-1
        x=tuple{i}(j);
        y=tuple{i}(j+1);
        plot([position(x,1),position(y,1)],[position(x,2),position(y,2)],'color','y');
        hold on;
    end
end
drawnow
end

