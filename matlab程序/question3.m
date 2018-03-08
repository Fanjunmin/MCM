function [ minThreePath,changeIndex,minExpose,previous_exposeTime,sencondPartPath] = question3( path,G,position )
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
PointJ=[72,74,76,81,82,83];
C_CarNum=[(1:6),(13:18)];
Zpoint=(3:8);
for i=1:68
    boolF(i)=1;
end
length=size(path,2);
    tuplePath1=cell(1,length);
    tuplePath2=cell(1,length);
for i=1:length
        [tuplePath1{i},tuplePath2{i}]=PathPartition(path{i});
end
[ exposeTime1,PathTime1,Gpath1 ] = backwardCorrect( tuplePath1,G,position );
[ exposeTime2,PathTime2,Gpath2 ] = forwardCorrect( tuplePath2,G,position,Zpoint);
time = LoadHideTime( tuplePath2,PathTime2,Zpoint);
previous_exposeTime=sum(exposeTime1+exposeTime2)-time;

for i=1:length
    endtime(i)=PathTime2{i}(end,end);
end

for i=1:3
    temp=0;
    for j=1:length
        if endtime(j)>temp & find(C_CarNum==j)
            temp=endtime(j);
            changeIndex(i)=j;
        end
    end
    endtime(changeIndex(i))=0;
end

for i=1:length
    plength=size(path{i},2);
    for j=1:plength
        if path{i}(j)>=9 & path{i}(j)<=68
            boolF(path{i}(j))=0;
        end
    end
end

for i=1:3
    plength=size(tuplePath2{changeIndex(i)},2);
    for j=2:plength
        if tuplePath2{changeIndex(i)}(j)>=9 & tuplePath2{changeIndex(i)}(j)<=68
            boolF(tuplePath2{changeIndex(i)}(j))=1;
        end
    end
end

for i=1:3
    tuplePath2{changeIndex(i)}=[];
end


for i=1:6
    [ThreeTime{i},ThreePath{i}] = ThreePathfromJ2F(PointJ(i),boolF,G,position);
end

minExpose=inf;
for i=1:18
    x=ceil(i/6);y=mod(i-1,3)+1;
    selectPath{1}=ThreePath{x}{y};
    for j=1:18
        x=ceil(j/6);y=mod(j-1,3)+1;
        selectPath{2}=ThreePath{x}{y};
        for k=1:18
            x=ceil(k/6);y=mod(k-1,3)+1;
            selectPath{3}=ThreePath{x}{y};
            
            if selectPath{1}(1)==selectPath{2}(1) && selectPath{1}(1)==selectPath{3}(1)
                continue;
            elseif selectPath{1}(end)==selectPath{2}(end)||selectPath{1}(end)==selectPath{3}(end)||selectPath{2}(end)==selectPath{3}(end)
                continue;
            end
            
            tuplePath2{changeIndex(1)}=selectPath{1};
            tuplePath2{changeIndex(2)}=selectPath{2};
            tuplePath2{changeIndex(3)}=selectPath{3};
            
            [currentExposeTime,PathTime2]  = forwardCorrect( tuplePath2,G,position,Zpoint);
            time = LoadHideTime( tuplePath2,PathTime2,Zpoint);
            currentExposeTime=sum(currentExposeTime)-time;
            if(currentExposeTime<minExpose)
                minExpose=currentExposeTime;
                minThreePath=selectPath;
                sencondPartPath=tuplePath2;
            end
        end
    end
end
minExpose=minExpose+sum(exposeTime1);
end

