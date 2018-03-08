function [tupleTimePath]=tuplePath2toTime(tuplePath,Start,G,position)
%将路径元组转化为路径时间元组
    type = '';
    tupleTimePath={};
    for i=1:24
        [row,col]=size(tuplePath{i});
        type=Rank2Type(i);
        tupleTimePath{i}=GetPointTime(tuplePath{i},G,type,Start,position);
    end
end

