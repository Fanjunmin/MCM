function [ G ] = addEdge( G,v1,v2,type)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
v1=upper(v1);
v2=upper(v2);
v1_s=v1(1);
v2_s=v2(1);
v1_n=str2num(strtok(v1,v1(1)));
v2_n=str2num(strtok(v2,v2(1)));
switch v1_s
    case 'Z'
        v1_n=v1_n+2;
    case 'F'
        v1_n=v1_n+8;
    case 'J'
        v1_n=v1_n+68;
end
switch v2_s
    case 'Z'
        v2_n=v2_n+2;
    case 'F'
        v2_n=v2_n+8;
    case 'J'
        v2_n=v2_n+68;
end
G(v1_n,v2_n)=type;
G(v2_n,v1_n)=type;
end

