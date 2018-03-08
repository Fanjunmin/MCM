function [bool] = isloadConfict(TimeWindows)
%UNTITLED3 此处显示有关此函数的摘要
%   此处显示详细说明
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

