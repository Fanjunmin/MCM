function [path1,path2] = PathPartition(path)
%将一段完整的路线分成两部分path1,path2
    [row,col] = size(path);
    path1=[path(1)];
    temp=0;
    j=0;
    for i=2:col
        path1(i)=path(i);
        if path(i)>=9 & path(i)<=68
            temp=path(i);
            j=i;
            break;
        end
    end
    path2=[temp];
    for i=j+1:col
        path2(i-j+1)=path(i);
    end     
end

