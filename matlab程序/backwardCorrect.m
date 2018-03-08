function [ exposeTime,PathTime,Gpath ] = backwardCorrect( tuplePath,G,position )
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
Gpath=cell(130,130);%��¼����·����ʱ�䴰����
tupleTimePath=tuplePath2toTime(tuplePath,0,G,position);%����·��������ʱ��
length=size(tuplePath,2);
PathTime=cell(1,length);%��¼��ͻ������·��ʱ��
exposeTime=zeros(1,length);%��¼��ͻ�����ı�¶ʱ��
endtimes=zeros(1,length);
for i=1:length
    endtimes(i)=tupleTimePath{i}(end);%����ÿ��·�Ľ���ʱ��
end
[sorttime,index]=sort(endtimes);%�Ե�·ʱ������
sorttime=fliplr(sorttime);
index=fliplr(index);
LastTime=sorttime(1);%һ��ʼ�趨����ʱ�����ʱ��·���Ľ���ʱ��
StartTime=0;%���ÿ�ʼʱ�䣬������¶�Ӧ��ʼʱ��
for i=1:length
    num=index(i);%��ǰ�༭�ķ���װ�ñ��
    pathLength=size(tuplePath{num},2);
    TimeIndex=LastTime;%�������ʱ���ʶ
    TimeForward=LastTime-endtimes(num);%�ó�����ʱ������ʱ���ʱ���
    PathTime{num}=zeros(pathLength-1,2);
    Timediff=0;%�ó��ܵ���ǰʱ����
    for j=pathLength:-1:2
        Pathid=[tuplePath{num}(j-1),tuplePath{num}(j)];%��ǰ·��λ�úͷ���
        TimeWindow=[tupleTimePath{num}(j-1),tupleTimePath{num}(j)]+TimeForward-Timediff;%��ǰ�����ڵ�ǰ·����ʱ�䴰���ȼ������ʱ��㣬�ټ�ȥ��ǰ��
        forward=Gpath{Pathid(1),Pathid(2)};backward=Gpath{Pathid(2),Pathid(1)};%�ҵ���ǰ·���Ѿ��е�ʱ�䴰
        
        if(G(Pathid(1),Pathid(2))==1)
            [correctTimeWindow,aheadTime]=PathWindowCorrect(forward,backward,TimeWindow,'ahead');%��������������·�������������ͻ
        else
            correctTimeWindow=TimeWindow;
            aheadTime=0;
        end
        Timediff=Timediff+aheadTime;%��������ǰ��
        TimeIndex=TimeIndex-aheadTime-(TimeWindow(2)-TimeWindow(1));%���µ�ǰʱ��λ�ñ�ʶ
        PathTime{num}(j-1,:) = correctTimeWindow;%����·������Ϣ
        Gpath{Pathid(1),Pathid(2)}=[Gpath{Pathid(1),Pathid(2)};correctTimeWindow];%���µ�ǰ·����ʱ�䴰
    end
    exposeTime(num)=LastTime-TimeIndex;
    if  TimeIndex<StartTime
        StartTime=TimeIndex;
    end
    
end
if StartTime<0
    for i=1:length
        pathLength=size(PathTime{i},2);
        for j=1:pathLength
            PathTime{i}=PathTime{i}-StartTime;
        end
    end
end


end

