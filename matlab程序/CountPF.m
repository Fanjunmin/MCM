function [PointFrequency] = CountPF(tuplePath)
%计算所有节点不包含初始点
[row1,col1]=size(tuplePath);
PointFrequency=zeros(1,130);
for i=1:col1
    tpi=tuplePath{i};
    [row2,col2]=size(tpi);
    for j=1:col2
        PointFrequency(tpi(j))=1+PointFrequency(tpi(j));
    end
end
end

