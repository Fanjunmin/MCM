function [bool] = isloadConfict(TimeWindows)
%UNTITLED3 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
bool=false;
length=size(TimeWindows,1);
for i=1:length
    c=0;
    for j=1:length
        if TimeWindows(i,1)>=TimeWindows(j,1) & TimeWindows(i,1)<TimeWindows(j,2) & i~=j
            c=c+1;
        end
    end
    if c>=2
        bool=true;
        break;
    end
end

end

