function [ time ] = LoadHideTime( Path,PathTime,Zpoint)
%UNTITLED7 此处显示有关此函数的摘要
%   此处显示详细说明
zlength=size(Zpoint,2);
ZtimeWindow=cell(1,size(Zpoint,2));%该时间窗对应所有在Z节点停留过的车辆的时间
length=size(Path,2);
for i=1:length
    plength=size(Path{i},2);
    for j=1:plength
        if  find(Zpoint==Path{i}(j))
            pid=Path{i}(j);
            Zindex=find(Zpoint==pid);
            ZtimeWindow{Zindex}=[ZtimeWindow{Zindex};[PathTime{i}(j-1,2),PathTime{i}(j,1)]];%找到车子在z点停留的时间，上一段路径的结束时间到这条路径的开始时间
        end
    end
end
time=zeros(1,zlength);
for i=1:zlength
    windowsNum=size(ZtimeWindow{i},1);
    temp=zeros(2,windowsNum);
    for j=1:windowsNum
        temp(1,2*j-1)=ZtimeWindow{i}(j,1);temp(1,2*j)=ZtimeWindow{i}(j,2);
        temp(2,2*j-1)=1;temp(2,2*j)=-1;
    end
    sorttemp=temp;
    [sortedtemp,index]=sort(sorttemp(1,:));
    carnum=0;
    for j=1:2*windowsNum-1
        carnum=carnum+temp(2,index(j));
        if carnum>2
            time(i)=time(i)+2*(sortedtemp(j+1)-sortedtemp(j));
        else
            time(i)=time(i)+carnum*(sortedtemp(j+1)-sortedtemp(j));
        end
    end
end

    time=sum(time);


end

