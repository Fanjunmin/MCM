function [ G ] = DrawG( G,position )
%UNTITLED12 此处显示有关此函数的摘要
%   此处显示详细说明
length=size(G,1);
for i=1:length
    for j=1:length
        if(G(i,j)==1)
            plot([position(i,1),position(j,1)],[position(i,2),position(j,2)],'b');
            hold on;
        elseif(G(i,j)==2)
            plot([position(i,1),position(j,1)],[position(i,2),position(j,2)],'r');
            hold on;
        end
    end
end
end

