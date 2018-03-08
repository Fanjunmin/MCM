function [ PathName ] = PathNum2Name( Path )
%UNTITLED8 此处显示有关此函数的摘要
%   此处显示详细说明
length=size(Path,2);
PathName=cell(1,length);
for i=1:length
    if(Path(i)<3)
        PathName(i)={strcat('D',num2str(Path(i)))};
    elseif(Path(i)<9)
        PathName(i)={strcat('Z',num2str(Path(i)-2))};
    elseif(Path(i)<69)
        PathName(i)={strcat('F',num2str(Path(i)-8))};
    else
        PathName(i)={strcat('J',num2str(Path(i)-68))};
    end
end
end

