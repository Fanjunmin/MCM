function [ exposeTime,PathTime,Gpath ] = forwardCorrect( tuplePath,G,position,Zpoint)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
ZtimeWindow=cell(1,size(Zpoint,2));%为装载点建立时间窗，便于判断等待时间
Gpath=cell(130,130);
tupleTimePath=tuplePath2toTime(tuplePath,0,G,position);
length=size(tuplePath,2);
PathTime=cell(1,length);
exposeTime=zeros(1,length);
endtimes=zeros(1,length);
for i=1:length
    endtimes(i)=tupleTimePath{i}(end);
end
[sorttime,index]=sort(endtimes);%对道路时间排序
sorttime=fliplr(sorttime);
index=fliplr(index);
LastTime=sorttime(1);%一开始设定结束时间是最长时间路径的结束时间
StartTime=0;%设置开始时间，方便更新对应开始时间
for i=1:length
    num=index(i);%当前编辑的发射装置编号
    pathLength=size(tuplePath{num},2);
    TimeIndex=StartTime;%正叙更新时间标识
    PathTime{num}=zeros(pathLength-1,2);
    Timediff=0;%该车总的等待时间量
    isLoad = false;
    if tuplePath{num}(1)<9 || tuplePath{num}(1)>68
        isLoad = true;
    end
    for j=1:pathLength-1
        Pathid=[tuplePath{num}(j),tuplePath{num}(j+1)];%当前路径位置和方向
        if  find(Zpoint==Pathid(1)) & ~(isLoad)
            Zindex=find(Zpoint==Pathid(1));
            [ZtimeWindow,delayTime]=LoadWindowCorrect(ZtimeWindow,Zindex,[TimeIndex,TimeIndex+0.1667]);%装载的只和同样需要装载的冲突
            TimeIndex=TimeIndex+0.1667+delayTime;
            isLoad = true;%只装载一次
            Timediff=Timediff+0.1667+delayTime;
        end
        TimeWindow=[tupleTimePath{num}(j),tupleTimePath{num}(j+1)]+Timediff;%当前车辆在当前路径的时间窗，加上总延迟时间,如果是装载点则再加装载时间
        forward=Gpath{Pathid(1),Pathid(2)};backward=Gpath{Pathid(2),Pathid(1)};%找到当前路径已经有的时间窗
        
        if(G(Pathid(1),Pathid(2))==1)
            [correctTimeWindow,delayTime]=PathWindowCorrect(forward,backward,TimeWindow,'delay');%调用修正函数对路径修正，避免冲突
        else
            correctTimeWindow=TimeWindow;
            delayTime=0;
        end
        
        Timediff=Timediff+delayTime;%更新总延迟量
        TimeIndex=TimeIndex+delayTime+(TimeWindow(2)-TimeWindow(1));%更新当前时间位置标识
        PathTime{num}(j,:) = correctTimeWindow;%更新路径的信息
        Gpath{Pathid(1),Pathid(2)}=[Gpath{Pathid(1),Pathid(2)};correctTimeWindow];%更新当前路径的时间窗
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

