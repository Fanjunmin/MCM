function [tuplePath, Time,boolF] = RandomPathAndTime(Ga,Gb,Gc)
boolF = ones(1,68); %F初始值全为1,1代表发射点未使用，0代表发射点已使用
%countZ = zeros(1,8);%Z初值全为0,代表经过转载地的发射装置个数
tuplePath1={};%存储第一段路径
tuplePath2={};%存储第二段路径
tuplePath3={};%存储第三段路径
tuplePath={};%存储总路径
Time=zeros(1,24);%存储时间
%{
    第一步：从待机区域到发射点
%}

%初始点在d1
for i=1:3
    [ga,gb,gc]=Sparse(Ga,Gb,Gc);
    min1 = inf;
    for j=9:68
        Ac=rand;
        if boolF(j)==1
            [Dist,Path]=graphshortestpath(ga,Name2Num('d1'),j,'Method','Dijkstra');
            if Ac<0.065
                break;
            end
        end
    end
    min1=Dist; %最小距离
    path1=Path; %对应路径
    L = j; %下标记录
    boolF(L) = 0; %变为零，表示已经被使用今后不再使用
    tuplePath1{i}=path1;%添加路径
    Time(i)=min1;%添加单程时间
end

for i=1:3
    [ga,gb,gc]=Sparse(Ga,Gb,Gc);
    min1 = inf;
    for j=9:68
        Ac=rand;
        if boolF(j)==1
            [Dist,Path]=graphshortestpath(gb,Name2Num('d1'),j,'Method','Dijkstra');
            if Ac<0.065
                break;
            end
        end
    end
    min1=Dist; %最小距离
    path1=Path; %对应路径
    L = j; %下标记录
    boolF(L) = 0; %变0表示已经被使用
    tuplePath1{3+i}=path1;
    Time(3+i)=min1;
end

for i=1:6
    [ga,gb,gc]=Sparse(Ga,Gb,Gc);
    min1 = inf;
    for j=9:68
        Ac=rand;
        if boolF(j)==1
            [Dist,Path]=graphshortestpath(gc,Name2Num('d1'),j,'Method','Dijkstra');
            if Ac<0.065
                break;
            end
        end
    end
    min1=Dist; %最小距离
    path1=Path; %对应路径
    L = j; %下标记录
    boolF(L) = 0; %变0表示已经被使用
    tuplePath1{6+i}=path1;
    Time(6+i)=min1;
end

%开始更新数据
%{
for j=1:12
    [Ga,Gb,Gc]=InfDis(G,Ga,Gb,Gc,tuplePath1{1,j});
end
%}
%初始点在d2
for i=1:3
    [ga,gb,gc]=Sparse(Ga,Gb,Gc);
    min1 = inf;
    for j=9:68
        Ac=rand;
        if boolF(j)==1
            [Dist,Path]=graphshortestpath(ga,Name2Num('d2'),j,'Method','Dijkstra');
             if Ac<0.065
                break;
            end
        end
    end
    min1=Dist; %最小距离
    path1=Path; %对应路径
    L = j; %下标记录
    boolF(L) = 0; %变0表示已经被使用
    tuplePath1{i+12}=path1;
    Time(i+12)=min1;
end

for i=1:3
    [ga,gb,gc]=Sparse(Ga,Gb,Gc);
    min1 = inf;
    for j=9:68
        Ac=rand;
        if boolF(j)==1
            [Dist,Path]=graphshortestpath(gb,Name2Num('d2'),j,'Method','Dijkstra');
             if Ac<0.065
                break;
            end
        end
    end
    min1=Dist; %最小距离
    path1=Path; %对应路径
    L = j; %下标记录
    boolF(L) = 0; %变0表示已经被使用
    tuplePath1{15+i}=path1;
    Time(15+i)=min1;
end

for i=1:6
    [ga,gb,gc]=Sparse(Ga,Gb,Gc);
    min1 = inf;
    for j=9:68
        Ac=rand;
        if boolF(j)==1
            [Dist,Path]=graphshortestpath(gc,Name2Num('d2'),j,'Method','Dijkstra');
             if Ac<0.065
                break;
            end
        end
    end
    min1=Dist; %最小距离
    path1=Path; %对应路径
    L = j; %下标记录
    boolF(L) = 0; %变0表示已经被使用
    tuplePath1{18+i}=path1;
    Time(18+i)=min1;
end

%开始更新数据
%{
for j=13:24
    [Ga,Gb,Gc]=InfDis(G,Ga,Gb,Gc,tuplePath1{1,j});
end
%}
%{
    第二步：从发射点到转载地域
%}

for i=1:24
    [ga,gb,gc]=Sparse(Ga,Gb,Gc);
    min2 = inf;
    if (i<=3 & i>=1)|(i<=15 & i>=13) %判断车种类
        g = ga;
    elseif(i<=6 & i>=4)|(i<=18 & i>=16)
        g = gb;
    else
        g = gc;
    end
    I = tuplePath1{i};
    for j=3:8
        Ac=rand;
        if boolF(j)==1
            [Dist,Path]=graphshortestpath(g,I(end),j,'Method','Dijkstra');
            if Ac<0.065
                break;
                
            end
        end
    end
    %Dijkstra算法
    min2=Dist; %最小距离
    path2=Path; %对应路径
    L = j; %下标记录
    %[Ga,Gb,Gc]=InfDis(G,Ga,Gb,Gc,tuplePath{1,j}); %数据更新
    tuplePath2{i}=path2(2:end);
    Time(i)=Time(i)+min2;%单程时间相加
end
%{
for i=1:24
    [Ga,Gb,Gc]=InfDis(G,Ga,Gb,Gc,tuplePath2{1,j});
end
%}
%{
    第三步：从转载地域到发射点
%}
for i=1:24
    [ga,gb,gc]=Sparse(Ga,Gb,Gc);
    min3 = inf;
    if (i<=3&i>=1)|(i<=15&i>=13) %判断车种类
        g = ga;
    elseif(i<=6&i>=4)|(i<=18&i>=16)
        g = gb;
    else
        g = gc;
    end
    I = tuplePath2{1,i};
    for j=9:68
        Ac=rand;
        if boolF(j)==1
            [Dist,Path]=graphshortestpath(g,I(end),j,'Method','Dijkstra');
            if Ac<0.065
                break;
            end
        end
    end
    min3=Dist; %最小距离
    path3=Path; %对应路径
    L = j; %下标记录
    boolF(L) = 0;
    %[Ga,Gb,Gc]=InfDis(G,Ga,Gb,Gc,tuplePath{1,j}); %数据更新
    tuplePath3{i}=path3(2:end);
    Time(i)=Time(i)+min3;%单程时间相加
end

for i=1:24
    tuplePath{i}=[tuplePath1{i},tuplePath2{i},tuplePath3{i}];
end
end
