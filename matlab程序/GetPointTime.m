function [PointTime]=GetPointTime(path,G,type,StartTime,position)
%type:车的种类:a,b,c
%将路径转化为路径时间
    [row,col]=size(path);
    PointTime=ones(1,col);
    PointTime(1) = StartTime;
    if type=='a'
        v1 = 45;
        v2 = 70;
    elseif type=='b'
        v1 = 35;
        v2 = 60;
    else
        v1 = 30;
        v2 = 50;
    end
    for i=1:col-1
        if G(path(1,i+1),path(1,i))==1
            aTime = norm(position(path(1,i+1),:)-position(path(1,i),:))/v1;
        else
            aTime = norm(position(path(1,i+1),:)-position(path(1,i),:))/v2;
        end
        PointTime(i+1) = PointTime(i)+ aTime;
    end
end
