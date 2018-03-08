function [ exposeTime,PathTime,Gpath ] = backwardCorrect( tuplePath,G,position )
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
Gpath=cell(130,130);%记录所有路径的时间窗序列
tupleTimePath=tuplePath2toTime(tuplePath,0,G,position);%计算路径的所有时间
length=size(tuplePath,2);
PathTime=cell(1,length);%记录冲突处理后的路径时间
exposeTime=zeros(1,length);%记录冲突处理后的暴露时间
endtimes=zeros(1,length);
for i=1:length
    endtimes(i)=tupleTimePath{i}(end);%计算每条路的结束时间
end
[sorttime,index]=sort(endtimes);%对道路时间排序
sorttime=fliplr(sorttime);
index=fliplr(index);
LastTime=sorttime(1);%一开始设定结束时间是最长时间路径的结束时间
StartTime=0;%设置开始时间，方便更新对应开始时间
for i=1:length
    num=index(i);%当前编辑的发射装置编号
    pathLength=size(tuplePath{num},2);
    TimeIndex=LastTime;%倒叙更新时间标识
    TimeForward=LastTime-endtimes(num);%该车结束时间和最后时间的时间差
    PathTime{num}=zeros(pathLength-1,2);
    Timediff=0;%该车总的提前时间量
    for j=pathLength:-1:2
        Pathid=[tuplePath{num}(j-1),tuplePath{num}(j)];%当前路径位置和方向
        TimeWindow=[tupleTimePath{num}(j-1),tupleTimePath{num}(j)]+TimeForward-Timediff;%当前车辆在当前路径的时间窗，先加至最后时间点，再减去提前量
        forward=Gpath{Pathid(1),Pathid(2)};backward=Gpath{Pathid(2),Pathid(1)};%找到当前路径已经有的时间窗
        
        if(G(Pathid(1),Pathid(2))==1)
            [correctTimeWindow,aheadTime]=PathWindowCorrect(forward,backward,TimeWindow,'ahead');%调用修正函数对路径修正，避免冲突
        else
            correctTimeWindow=TimeWindow;
            aheadTime=0;
        end
        Timediff=Timediff+aheadTime;%更新总提前量
        TimeIndex=TimeIndex-aheadTime-(TimeWindow(2)-TimeWindow(1));%更新当前时间位置标识
        PathTime{num}(j-1,:) = correctTimeWindow;%更新路径的信息
        Gpath{Pathid(1),Pathid(2)}=[Gpath{Pathid(1),Pathid(2)};correctTimeWindow];%更新当前路径的时间窗
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

