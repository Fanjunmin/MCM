function [table] = InformationTable(G,tuplePath,tupleTimePath)
%table������Ϣ�ܱ�
%count���ؿ��ܴ��ڳ�ͻ�ĵ�·����
    table={};
    table{130,130}={};%�ܱ�
    for i=1:24
        ti = tuplePath{i};
        tti = tupleTimePath{i};
        [row,col]=size(ti);
        for j=1:col-1
            if(G(ti(j),ti(j+1)))~=2 %���ɵ�˫����
                [row,Col] = size(table{ti(j),ti(j+1)});
                table{ti(j),ti(j+1)}{Col+1} = i;%i��ʾ�ڼ���
                table{ti(j),ti(j+1)}{Col+2} =[tti(j),tti(j+1)];
            end
        end
    end
end

