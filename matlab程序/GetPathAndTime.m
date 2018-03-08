function [tuplePath1,tuplePathNext,tuplePath, Time,boolF] = GetPathAndTime(position)
%����̰���㷨
boolF = ones(1,68); %F��ʼֵȫΪ1,1�������δʹ�ã�0���������ʹ��
tuplePath1={};%�洢��һ��·��
tuplePath2={};%�洢�ڶ���·��
tuplePath3={};%�洢������·��
tuplePathNext={};%�洢�ڶ��κ͵����ε�·����
tuplePath={};%�洢��·��
Time=zeros(1,24);%�洢ʱ��
G=BuildG(); %��ͼ
[Ga,Gb,Gc]=BuildTimeG(G,position); %��ʱ��ͼ
[ga,gb,gc]=Sparse(Ga,Gb,Gc);%�������·������ϡ�����
%{
    ��һ�����Ӵ������򵽷����
%}

%��ʼ����d1
%C��
for i=1:6
    min1 = inf;
    for j=9:68
        if boolF(j)==1
            [Dist,Path]=graphshortestpath(gc,Name2Num('d1'),j,'Method','Dijkstra');
            if Dist<min1 %Dijkstra�㷨
                min1=Dist; %��С����
                path1=Path; %��Ӧ·��
                L = j; %�±��¼
            end
        end
    end
    boolF(L) = 0; %��Ϊ�㣬��ʾ�Ѿ���ʹ��,�����ʹ��
    tuplePath1{i}=path1;%���·��
    Time(i)=min1;%��ӵ���ʱ��
end

%B��
for i=1:3
    min1 = inf;
    for j=9:68
        if boolF(j)==1
            [Dist,Path]=graphshortestpath(gb,Name2Num('d1'),j,'Method','Dijkstra');
            if Dist<min1 %Dijkstra�㷨
                min1=Dist; %��С����
                path1=Path; %��Ӧ·��
                L = j; %�±��¼
            end
        end
    end
    boolF(L) = 0; %��0��ʾ�Ѿ���ʹ��
    tuplePath1{6+i}=path1;
    Time(6+i)=min1;
end

%A��
for i=1:3
    min1 = inf;
    for j=9:68
        if boolF(j)==1
            [Dist,Path]=graphshortestpath(ga,Name2Num('d1'),j,'Method','Dijkstra');
            if Dist<min1 %Dijkstra�㷨
                min1=Dist; %��С����
                path1=Path; %��Ӧ·��
                L = j; %�±��¼
            end
        end
    end
    boolF(L) = 0; %��0��ʾ�Ѿ���ʹ��
    tuplePath1{9+i}=path1;
    Time(9+i)=min1;
end

%��ʼ����d2
%A��
for i=1:6
    min1 = inf;
    for j=9:68
        if boolF(j)==1
            [Dist,Path]=graphshortestpath(gc,Name2Num('d2'),j,'Method','Dijkstra');
            if Dist<min1 %Dijkstra�㷨
                min1=Dist; %��С����
                path1=Path; %��Ӧ·��
                L = j; %�±��¼
            end
        end
    end
    boolF(L) = 0; %��0��ʾ�Ѿ���ʹ��
    tuplePath1{i+12}=path1;
    Time(i+12)=min1;
end

%B��
for i=1:3
    min1 = inf;
    for j=9:68
        if boolF(j)==1
            [Dist,Path]=graphshortestpath(gb,Name2Num('d2'),j,'Method','Dijkstra');
            if Dist<min1 %Dijkstra�㷨
                min1=Dist; %��С����
                path1=Path; %��Ӧ·��
                L = j; %�±��¼
            end
        end
    end
    boolF(L) = 0; %��0��ʾ�Ѿ���ʹ��
    tuplePath1{18+i}=path1;
    Time(18+i)=min1;
end

%C��
for i=1:3
    min1 = inf;
    for j=9:68
        if boolF(j)==1
            [Dist,Path]=graphshortestpath(ga,Name2Num('d2'),j,'Method','Dijkstra');
            if Dist<min1 %Dijkstra�㷨
                min1=Dist; %��С����
                path1=Path; %��Ӧ·��
                L = j; %�±��¼
            end
        end
    end
    boolF(L) = 0; %��0��ʾ�Ѿ���ʹ��
    tuplePath1{21+i}=path1;
    Time(21+i)=min1;
end

%{
    �ڶ������ӷ���㵽ת�ص���
%}

for i=1:24
    min2 = inf;
    if (i<=6 & i>=1)|(i<=18 & i>=13) %�жϳ�����
        g = gc;
    elseif(i<=9 & i>=7)|(i<=21 & i>=19)
        g = gb;
    else
        g = ga;
    end
    I = tuplePath1{i};%�ڶ�����ʼ�㼴��һ����ĩ�ڵ�
    for j=3:8
        [Dist,Path]=graphshortestpath(g,I(end),j,'Method','Dijkstra');
        if Dist<min2 %Dijkstra�㷨
            min2=Dist; %��С����
            path2=Path; %��Ӧ·��
        end
    end
    tuplePath2{i}=path2(2:end);%·������
    Time(i)=Time(i)+min2;%����ʱ�����
end

%{
    ����������ת�ص��򵽷����
%}

for i=1:24
    min3 = inf;
    if (i<=6 & i>=1)|(i<=18 & i>=13) %�жϳ�����
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
            if Dist<min3 %Dijkstra�㷨
                min3=Dist; %��С����
                path3=Path; %��Ӧ·��
                L = j; %�±��¼
            end
        end
    end
    boolF(L) = 0;
    tuplePath3{i}=path3(2:end);
    Time(i)=Time(i)+min3;%����ʱ�����
end

for i=1:24
    tuplePathNext{i}=[tuplePath1{i}(end),tuplePath2{i},tuplePath3{i}];
    tuplePath{i}=[tuplePath1{i},tuplePath2{i},tuplePath3{i}];
end
end
