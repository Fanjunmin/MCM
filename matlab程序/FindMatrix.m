function [Matrix] = FindMatrix(G,PointFrequency,PointLastTime)
%PointFrequency:所有车辆经过点的频次
%PointLastTime;所有车辆在点的停留时间
PFmax=max(PointFrequency);
PFmin=min(PointFrequency);
PLTmax=max(PointLastTime);
PLTmin=min(PointLastTime);
Martix=zeros(130,130);
w=zeros(1,130);
M=zeros(1,130);
for i=1:130
    PointFrequency(i)=(PointFrequency(i)-PFmin)/(PFmax-PFmin);%归一化
    PointLastTime(i)=(PointLastTime(i)-PLTmin)/(PLTmax-PLTmin);
    w(i)=(PointFrequency(i)+PointLastTime(i))/2;
end
for j=1:130
    M(j)=sum(G(:,j));
end
for i=1:130
    for j=1:130
        Matrix(i,j)=G(i,j)*w(i)/M(j);
    end
end
end