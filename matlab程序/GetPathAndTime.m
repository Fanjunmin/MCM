function [tuplePath1,tuplePathNext,tuplePath, Time,boolF] = GetPathAndTime(position)
%采用贪心算法
boolF = ones(1,68); %F初始值全为1,1代表发射点未使用，0代表发射点已使用
tuplePath1={};%存储第一段路径
tuplePath2={};%存储第二段路径
tuplePath3={};%存储第三段路径
tuplePathNext={};%存储第二段和第三段的路径和
tuplePath={};%存储总路径
Time=zeros(1,24);%存储时间
G=BuildG(); %建图
[Ga,Gb,Gc]=BuildTimeG(G,position); %建时间图
[ga,gb,gc]=Sparse(Ga,Gb,Gc);%构造最短路径所用稀疏矩阵
%{
    第一步：从待机区域到发射点
%}

%初始点在d1
%C车
for i=1:6
    min1 = inf;
    for j=9:68
        if boolF(j)==1
            [Dist,Path]=graphshortestpath(gc,Name2Num('d1'),j,'Method','Dijkstra');
            if Dist<min1 %Dijkstra算法
                min1=Dist; %最小距离
                path1=Path; %对应路径
                L = j; %下标记录
            end
        end
    end
    boolF(L) = 0; %变为零，表示已经被使用,今后不再使用
    tuplePath1{i}=path1;%添加路径
    Time(i)=min1;%添加单程时间
end

%B车
for i=1:3
    min1 = inf;
    for j=9:68
        if boolF(j)==1
            [Dist,Path]=graphshortestpath(gb,Name2Num('d1'),j,'Method','Dijkstra');
            if Dist<min1 %Dijkstra算法
                min1=Dist; %最小距离
                path1=Path; %对应路径
                L = j; %下标记录
            end
        end
    end
    boolF(L) = 0; %变0表示已经被使用
    tuplePath1{6+i}=path1;
    Time(6+i)=min1;
end

%A车
for i=1:3
    min1 = inf;
    for j=9:68
        if boolF(j)==1
            [Dist,Path]=graphshortestpath(ga,Name2Num('d1'),j,'Method','Dijkstra');
            if Dist<min1 %Dijkstra算法
                min1=Dist; %最小距离
                path1=Path; %对应路径
                L = j; %下标记录
            end
        end
    end
    boolF(L) = 0; %变0表示已经被使用
    tuplePath1{9+i}=path1;
    Time(9+i)=min1;
end

%初始点在d2
%A车
for i=1:6
    min1 = inf;
    for j=9:68
        if boolF(j)==1
            [Dist,Path]=graphshortestpath(gc,Name2Num('d2'),j,'Method','Dijkstra');
            if Dist<min1 %Dijkstra算法
                min1=Dist; %最小距离
                path1=Path; %对应路径
                L = j; %下标记录
            end
        end
    end
    boolF(L) = 0; %变0表示已经被使用
    tuplePath1{i+12}=path1;
    Time(i+12)=min1;
end

%B车
for i=1:3
    min1 = inf;
    for j=9:68
        if boolF(j)==1
            [Dist,Path]=graphshortestpath(gb,Name2Num('d2'),j,'Method','Dijkstra');
            if Dist<min1 %Dijkstra算法
                min1=Dist; %最小距离
                path1=Path; %对应路径
                L = j; %下标记录
            end
        end
    end
    boolF(L) = 0; %变0表示已经被使用
    tuplePath1{18+i}=path1;
    Time(18+i)=min1;
end

%C车
for i=1:3
    min1 = inf;
    for j=9:68
        if boolF(j)==1
            [Dist,Path]=graphshortestpath(ga,Name2Num('d2'),j,'Method','Dijkstra');
            if Dist<min1 %Dijkstra算法
                min1=Dist; %最小距离
                path1=Path; %对应路径
                L = j; %下标记录
            end
        end
    end
    boolF(L) = 0; %变0表示已经被使用
    tuplePath1{21+i}=path1;
    Time(21+i)=min1;
end

%{
    第二步：从发射点到转载地域
%}

for i=1:24
    min2 = inf;
    if (i<=6 & i>=1)|(i<=18 & i>=13) %判断车种类
        g = gc;
    elseif(i<=9 & i>=7)|(i<=21 & i>=19)
        g = gb;
    else
        g = ga;
    end
    I = tuplePath1{i};%第二步初始点即第一步的末节点
    for j=3:8
        [Dist,Path]=graphshortestpath(g,I(end),j,'Method','Dijkstra');
        if Dist<min2 %Dijkstra算法
            min2=Dist; %最小距离
            path2=Path; %对应路径
        end
    end
    tuplePath2{i}=path2(2:end);%路径叠加
    Time(i)=Time(i)+min2;%单程时间相加
end

%{
    第三步：从转载地域到发射点
%}

for i=1:24
    min3 = inf;
    if (i<=6 & i>=1)|(i<=18 & i>=13) %判断车种类
        g = gc;
    elseif(i<=9 & i>=7)|(i<=21 & i>=19)
        g = gb;
    else
        g = ga;
    end
    I = tuplePath2{i};
    for j=9:68
        if boolF(j)==1
            [Dist,Path]=graphshortestpath(g,I(end),j,'Method','Dijkstra');
            if Dist<min3 %Dijkstra算法
                min3=Dist; %最小距离
                path3=Path; %对应路径
                L = j; %下标记录
            end
        end
    end
    boolF(L) = 0;
    tuplePath3{i}=path3(2:end);
    Time(i)=Time(i)+min3;%单程时间相加
end

for i=1:24
    tuplePathNext{i}=[tuplePath1{i}(end),tuplePath2{i},tuplePath3{i}];
    tuplePath{i}=[tuplePath1{i},tuplePath2{i},tuplePath3{i}];
end
end
