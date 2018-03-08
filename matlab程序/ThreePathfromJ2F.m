function [ThreeTime,ThreePath] = ThreePathfromJ2F(PointJ,boolF,G,position)
%对于参数PointJ，找到三条到未使用的F点的最短路径，车辆为C车
%PointJ范围[J04,J06,J08,J13,J14,J15]对应的数字[72,74,76,81,82,83]
ThreePath={};%该元组存储三条J到F点的最短路径
ThreeTime=zeros(1,3); %该数组存储三条最短路径的时间消耗
[Ga,Gb,Gc]=BuildTimeG(G,position); %建时间图
[ga,gb,gc]=Sparse(Ga,Gb,Gc);%构造最短路径所用稀疏矩阵
for k=1:3
    min1=1000;
    for i=9:68
        if boolF(i)==1
            [Dist,Path]=graphshortestpath(gc,PointJ,i,'Method','Dijkstra');
            if Dist<min1 %Dijkstra算法
                min1=Dist; %最小距离
                path1=Path; %对应路径
                L = i; %下标记录
            end
        end
    end
    boolF(L) = 0; %变为零，表示已经被使用,今后不再使用
    ThreePath{k}=path1;%添加路径
    ThreeTime(k)=min1;%添加时间消耗
end
end

