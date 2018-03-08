function [ v1_n ] = Name2Num( v1)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
v1=upper(v1);
v1_s=v1(1);
v1_n=str2num(strtok(v1,v1(1)));
switch v1_s
    case 'Z'
        v1_n=v1_n+2;
    case 'F'
        v1_n=v1_n+8;
    case 'J'
        v1_n=v1_n+68;
end

end

