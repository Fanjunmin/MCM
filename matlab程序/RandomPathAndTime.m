function [tuplePath, Time,boolF] = RandomPathAndTime(Ga,Gb,Gc)
boolF = ones(1,68); %F��ʼֵȫΪ1,1�������δʹ�ã�0���������ʹ��
%countZ = zeros(1,8);%Z��ֵȫΪ0,������ת�صصķ���װ�ø���
tuplePath1={};%�洢��һ��·��
tuplePath2={};%�洢�ڶ���·��
tuplePath3={};%�洢������·��
tuplePath={};%�洢��·��
Time=zeros(1,24);%�洢ʱ��
%{
    ��һ�����Ӵ������򵽷����
%}

%��ʼ����d1
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
    min1=Dist; %��С����
    path1=Path; %��Ӧ·��
    L = j; %�±��¼
    boolF(L) = 0; %��Ϊ�㣬��ʾ�Ѿ���ʹ�ý����ʹ��
    tuplePath1{i}=path1;%���·��
    Time(i)=min1;%��ӵ���ʱ��
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
    min1=Dist; %��С����
    path1=Path; %��Ӧ·��
    L = j; %�±��¼
    boolF(L) = 0; %��0��ʾ�Ѿ���ʹ��
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
    min1=Dist; %��С����
    path1=Path; %��Ӧ·��
    L = j; %�±��¼
    boolF(L) = 0; %��0��ʾ�Ѿ���ʹ��
    tuplePath1{6+i}=path1;
    Time(6+i)=min1;
end

%��ʼ��������
%{
for j=1:12
    [Ga,Gb,Gc]=InfDis(G,Ga,Gb,Gc,tuplePath1{1,j});
end
%}
%��ʼ����d2
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
    min1=Dist; %��С����
    path1=Path; %��Ӧ·��
    L = j; %�±��¼
    boolF(L) = 0; %��0��ʾ�Ѿ���ʹ��
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
    min1=Dist; %��С����
    path1=Path; %��Ӧ·��
    L = j; %�±��¼
    boolF(L) = 0; %��0��ʾ�Ѿ���ʹ��
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
    min1=Dist; %��С����
    path1=Path; %��Ӧ·��
    L = j; %�±��¼
    boolF(L) = 0; %��0��ʾ�Ѿ���ʹ��
    tuplePath1{18+i}=path1;
    Time(18+i)=min1;
end

%��ʼ��������
%{
for j=13:24
    [Ga,Gb,Gc]=InfDis(G,Ga,Gb,Gc,tuplePath1{1,j});
end
%}
%{
    �ڶ������ӷ���㵽ת�ص���
%}

for i=1:24
    [ga,gb,gc]=Sparse(Ga,Gb,Gc);
    min2 = inf;
    if (i<=3 & i>=1)|(i<=15 & i>=13) %�жϳ�����
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
    %Dijkstra�㷨
    min2=Dist; %��С����
    path2=Path; %��Ӧ·��
    L = j; %�±��¼
    %[Ga,Gb,Gc]=InfDis(G,Ga,Gb,Gc,tuplePath{1,j}); %���ݸ���
    tuplePath2{i}=path2(2:end);
    Time(i)=Time(i)+min2;%����ʱ�����
end
%{
for i=1:24
    [Ga,Gb,Gc]=InfDis(G,Ga,Gb,Gc,tuplePath2{1,j});
end
%}
%{
    ����������ת�ص��򵽷����
%}
for i=1:24
    [ga,gb,gc]=Sparse(Ga,Gb,Gc);
    min3 = inf;
    if (i<=3&i>=1)|(i<=15&i>=13) %�жϳ�����
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
    min3=Dist; %��С����
    path3=Path; %��Ӧ·��
    L = j; %�±��¼
    boolF(L) = 0;
    %[Ga,Gb,Gc]=InfDis(G,Ga,Gb,Gc,tuplePath{1,j}); %���ݸ���
    tuplePath3{i}=path3(2:end);
    Time(i)=Time(i)+min3;%����ʱ�����
end

for i=1:24
    tuplePath{i}=[tuplePath1{i},tuplePath2{i},tuplePath3{i}];
end
end
