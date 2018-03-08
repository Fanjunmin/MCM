function [ TotalExposeTime,time,allExposeTime] = TrueExposetime( Path,G,position,Zpoint)
%UNTITLED5 此处显示有关此函数的摘要
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
    allExposeTime=exposeTime1+exposeTime2;
    TotalExposeTime=sum(exposeTime1+exposeTime2)-time;

end

