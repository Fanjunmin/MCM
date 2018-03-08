function [ bool ] = isPathConfict( forward,backward )
%UNTITLED16 此处显示有关此函数的摘要
%   此处显示详细说明
bool=false;
lengthF=size(forward,1);
lengthB=size(backward,1);
for i=1:lengthF
    for j=1:lengthB
        if ~(forward(i,2)<=backward(j,1) || forward(i,1)>=backward(j,2))
            bool=true;
            break;
        end
    end
end
 for i=1:lengthB-1
     for j=i+1:lengthB
         if backward(i,1)<backward(j,1) && backward(i,2)>backward(j,2)
             bool=true;
             break;
         elseif backward(i,1)>backward(j,1) && backward(i,2)<backward(j,2)
             bool=true;
             break;
         end
     end
 end
 for i=1:lengthF-1
     for j=i+1:lengthF
         if forward(i,1)<forward(j,1) && forward(i,2)>forward(j,2)
             bool=true;
             break;
         elseif forward(i,1)>forward(j,1) && forward(i,2)<forward(j,2)
             bool=true;
             break;
         end
     end
 end
 
end

