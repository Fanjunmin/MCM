function [table] = InformationTable(G,tuplePath,tupleTimePath)
%table返回信息总表
%count返回可能存在冲突的道路数量
    table={};
    table{130,130}={};%总表
    for i=1:24
        ti = tuplePath{i};
        tti = tupleTimePath{i};
        [row,col]=size(ti);
        for j=1:col-1
            if(G(ti(j),ti(j+1)))~=2 %主干道双向畅行
                [row,Col] = size(table{ti(j),ti(j+1)});
                table{ti(j),ti(j+1)}{Col+1} = i;%i表示第几车
                table{ti(j),ti(j+1)}{Col+2} =[tti(j),tti(j+1)];
            end
        end
    end
end

