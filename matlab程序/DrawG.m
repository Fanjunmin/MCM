function [ G ] = DrawG( G,position )
%UNTITLED12 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
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

