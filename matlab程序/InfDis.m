function [Ga,Gb,Gc]=InfDis(G,Ga,Gb,Gc,path)
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
[row,column]=size(path);
for i=1:(column-1)
    if G(path(1,i+1),path(1,i))==1
        Ga(path(1,i+1),path(1,i))=0;
        Gb(path(1,i+1),path(1,i))=0;
        Gc(path(1,i+1),path(1,i))=0;
    end
end
end