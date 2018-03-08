function [ exposeTime,PathTime,Gpath ] = forwardCorrect( tuplePath,G,position,Zpoint)
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
ZtimeWindow=cell(1,size(Zpoint,2));%Ϊװ�ص㽨��ʱ�䴰�������жϵȴ�ʱ��
Gpath=cell(130,130);
tupleTimePath=tuplePath2toTime(tuplePath,0,G,position);
length=size(tuplePath,2);
PathTime=cell(1,length);
exposeTime=zeros(1,length);
endtimes=zeros(1,length);
for i=1:length
    endtimes(i)=tupleTimePath{i}(end);
end
[sorttime,index]=sort(endtimes);%�Ե�·ʱ������
sorttime=fliplr(sorttime);
index=fliplr(index);
LastTime=sorttime(1);%һ��ʼ�趨����ʱ�����ʱ��·���Ľ���ʱ��
StartTime=0;%���ÿ�ʼʱ�䣬������¶�Ӧ��ʼʱ��
for i=1:length
    num=index(i);%��ǰ�༭�ķ���װ�ñ��
    pathLength=size(tuplePath{num},2);
    TimeIndex=StartTime;%�������ʱ���ʶ
    PathTime{num}=zeros(pathLength-1,2);
    Timediff=0;%�ó��ܵĵȴ�ʱ����
    isLoad = false;
    if tuplePath{num}(1)<9 || tuplePath{num}(1)>68
        isLoad = true;
    end
    for j=1:pathLength-1
        Pathid=[tuplePath{num}(j),tuplePath{num}(j+1)];%��ǰ·��λ�úͷ���
        if  find(Zpoint==Pathid(1)) & ~(isLoad)
            Zindex=find(Zpoint==Pathid(1));
            [ZtimeWindow,delayTime]=LoadWindowCorrect(ZtimeWindow,Zindex,[TimeIndex,TimeIndex+0.1667]);%װ�ص�ֻ��ͬ����Ҫװ�صĳ�ͻ
            TimeIndex=TimeIndex+0.1667+delayTime;
            isLoad = true;%ֻװ��һ��
            Timediff=Timediff+0.1667+delayTime;
        end
        TimeWindow=[tupleTimePath{num}(j),tupleTimePath{num}(j+1)]+Timediff;%��ǰ�����ڵ�ǰ·����ʱ�䴰���������ӳ�ʱ��,�����װ�ص����ټ�װ��ʱ��
        forward=Gpath{Pathid(1),Pathid(2)};backward=Gpath{Pathid(2),Pathid(1)};%�ҵ���ǰ·���Ѿ��е�ʱ�䴰
        
        if(G(Pathid(1),Pathid(2))==1)
            [correctTimeWindow,delayTime]=PathWindowCorrect(forward,backward,TimeWindow,'delay');%��������������·�������������ͻ
        else
            correctTimeWindow=TimeWindow;
            delayTime=0;
        end
        
        Timediff=Timediff+delayTime;%�������ӳ���
        TimeIndex=TimeIndex+delayTime+(TimeWindow(2)-TimeWindow(1));%���µ�ǰʱ��λ�ñ�ʶ
        PathTime{num}(j,:) = correctTimeWindow;%����·������Ϣ
        Gpath{Pathid(1),Pathid(2)}=[Gpath{Pathid(1),Pathid(2)};correctTimeWindow];%���µ�ǰ·����ʱ�䴰
    end
    %exposeTime(num)=TimeIndex-StartTime;
    if  TimeIndex>LastTime
        LastTime=TimeIndex;
    end
    
end
for i=1:length
    exposeTime(i)=LastTime;
end


end

