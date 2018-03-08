function [ PTC,PathTime,ptcn] = CorrectPointTimeChart( Path,G,position,Zpoint)%生成表格
%UNTITLED5 此处显示有关此函数的摘要
%   此处显示详细说明
    length=size(Path,2);
    index=[(13:18),(7:9),(1:3),(19:24),(10:12),(4:6)];
    PTC=cell(length,1);
    tuplePath1=cell(1,length);
    tuplePath2=cell(1,length);
    for i=1:length
        [tuplePath1{i},tuplePath2{i}]=PathPartition(Path{i});
    end
    [ exposeTime1,PathTime1,Gpath1 ] = backwardCorrect( tuplePath1,G,position );
    [ exposeTime2,PathTime2,Gpath2 ] = forwardCorrect( tuplePath2,G,position,Zpoint);
    
    for i=1:length
        PathTime2{i}=PathTime2{i}+PathTime1{i}(end,end);
        PathTime{i}=[PathTime1{i};PathTime2{i}];
    end
    
    for i=1:length
        PathName=PathNum2Name(Path{i});
        plength=size(Path{i},2);
        PTC{index(i),1}=PathName{1};
        ptcn(index(i),1)=Path{i}(1);
        for j=2:plength
            t1=PathTime{i}(j-1,1)*60;
            t2=PathTime{i}(j-1,2)*60;
           PTC{index(i),j*3-4}=num2str(t1,'%6.1f');
           PTC{index(i),j*3+1-4}=num2str(t2,'%6.1f');
           PTC{index(i),j*3+2-4}=PathName{j};
           ptcn(index(i),j*3-4)=t1;
           ptcn(index(i),j*3+1-4)=t2;
           ptcn(index(i),j*3+2-4)=Path{i}(j);
        end
        for j=2:plength
           temp=PTC{index(i),j*3-3};
           PTC{index(i),j*3-3}=PTC{index(i),j*3+1-3};
           PTC{index(i),j*3+1-3}=temp;
           temp=ptcn(index(i),j*3-3);
           ptcn(index(i),j*3-3)=ptcn(index(i),j*3+1-3);
           ptcn(index(i),j*3+1-3)=temp;
        end
           PTC{index(i),plength*3-1}=num2str((exposeTime2(i)+PathTime1{i}(end,end))*60,'%6.1f');
           ptcn(index(i),plength*3-1)=(exposeTime2(i)+PathTime1{i}(end,end))*60;
    end
end
