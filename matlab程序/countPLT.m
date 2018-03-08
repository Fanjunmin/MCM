function [PointLastTime] = countPLT(ptcn)
[row1,col1]=size(ptcn);
PointLastTime=zeros(1,130);
for i=1:24
    ptcni=ptcn(i,:);
    [row2,col2]=size(ptcni);
    PointLastTime(ptcni(1))=ptcni(2);
    for j=3:col2
        if ptcni(j)~=0 & mod(j,3)==0
            PointLastTime(ptcni(j))=ptcni(j+2)-ptcni(j+1);
        end
    end
end
end

