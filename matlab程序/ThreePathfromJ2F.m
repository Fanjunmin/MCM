function [ThreeTime,ThreePath] = ThreePathfromJ2F(PointJ,boolF,G,position)
%���ڲ���PointJ���ҵ�������δʹ�õ�F������·��������ΪC��
%PointJ��Χ[J04,J06,J08,J13,J14,J15]��Ӧ������[72,74,76,81,82,83]
ThreePath={};%��Ԫ��洢����J��F������·��
ThreeTime=zeros(1,3); %������洢�������·����ʱ������
[Ga,Gb,Gc]=BuildTimeG(G,position); %��ʱ��ͼ
[ga,gb,gc]=Sparse(Ga,Gb,Gc);%�������·������ϡ�����
for k=1:3
    min1=1000;
    for i=9:68
        if boolF(i)==1
            [Dist,Path]=graphshortestpath(gc,PointJ,i,'Method','Dijkstra');
            if Dist<min1 %Dijkstra�㷨
                min1=Dist; %��С����
                path1=Path; %��Ӧ·��
                L = i; %�±��¼
            end
        end
    end
    boolF(L) = 0; %��Ϊ�㣬��ʾ�Ѿ���ʹ��,�����ʹ��
    ThreePath{k}=path1;%���·��
    ThreeTime(k)=min1;%���ʱ������
end
end

