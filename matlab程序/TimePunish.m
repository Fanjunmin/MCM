function [ punish,TotalExposeTime,variance,alone] = TimePunish( Path,G,position,Zpoint,Ratio)
d=0.8;
e=0.1;
index=[(13:18),(7:9),(1:3),(19:24),(10:12),(4:6)];
%UNTITLED6 此处显示有关此函数的摘要
%   此处显示详细说明
length=size(Path,2);
    tuplePath1=cell(1,length);
    tuplePath2=cell(1,length);
    for i=1:length
        [tuplePath1{i},tuplePath2{i}]=PathPartition(Path{i});
    end
    [ exposeTime1,PathTime1,Gpath1 ] = backwardCorrect( tuplePath1,G,position );
    [ exposeTime2,PathTime2,Gpath2 ] = forwardCorrect( tuplePath2,G,position,Zpoint);
    time = LoadHideTime( tuplePath2,PathTime2,Zpoint);
    allexposeTime=(exposeTime1+exposeTime2);
    TotalExposeTime=sum(exposeTime1+exposeTime2)-time;

     for i=1:length
        PathTime2{i}=PathTime2{i}+PathTime1{i}(end,end);
        PathTime{i}=[PathTime1{i};PathTime2{i}];
    end
    
    for i=1:length
        plength=size(Path{i},2);
        ptcn(index(i),1)=Path{i}(1);
        for j=2:plength
            t1=PathTime{i}(j-1,1)*60;
            t2=PathTime{i}(j-1,2)*60;
           ptcn(index(i),j*3-4)=t1;
           ptcn(index(i),j*3+1-4)=t2;
           ptcn(index(i),j*3+2-4)=Path{i}(j);
        end
        for j=2:plength
           temp=ptcn(index(i),j*3-3);
           ptcn(index(i),j*3-3)=ptcn(index(i),j*3+1-3);
           ptcn(index(i),j*3+1-3)=temp;
        end
           ptcn(index(i),plength*3-1)=(exposeTime2(index(i))+PathTime1{index(i)}(end,end))*60;
    end
    
    PointFrequency = CountPF(Path);
    PointLastTime = countPLT(ptcn);
    Matrix=FindMatrix(G,PointFrequency,PointLastTime);
    [row,col]=size(Matrix);
    R1=ones(col,1);
    E=ones(col,1);
    R=(1-d)*E+d*Matrix*R1;
    while norm(R-R1)<=e
      R=(1-d)*E+d*Matrix*R;
    end
    variance=var(R)*Ratio(1);
    alone=var(allexposeTime)*Ratio(2);
    punish=variance+TotalExposeTime*Ratio(3)+alone;
end

