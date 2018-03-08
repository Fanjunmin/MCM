function [ time ] = LoadHideTime( Path,PathTime,Zpoint)
%UNTITLED7 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
zlength=size(Zpoint,2);
ZtimeWindow=cell(1,size(Zpoint,2));%��ʱ�䴰��Ӧ������Z�ڵ�ͣ�����ĳ�����ʱ��
length=size(Path,2);
for i=1:length
    plength=size(Path{i},2);
    for j=1:plength
        if  find(Zpoint==Path{i}(j))
            pid=Path{i}(j);
            Zindex=find(Zpoint==pid);
            ZtimeWindow{Zindex}=[ZtimeWindow{Zindex};[PathTime{i}(j-1,2),PathTime{i}(j,1)]];%�ҵ�������z��ͣ����ʱ�䣬��һ��·���Ľ���ʱ�䵽����·���Ŀ�ʼʱ��
        end
    end
end
time=zeros(1,zlength);
for i=1:zlength
    windowsNum=size(ZtimeWindow{i},1);
    temp=zeros(2,windowsNum);
    for j=1:windowsNum
        temp(1,2*j-1)=ZtimeWindow{i}(j,1);temp(1,2*j)=ZtimeWindow{i}(j,2);
        temp(2,2*j-1)=1;temp(2,2*j)=-1;
    end
    sorttemp=temp;
    [sortedtemp,index]=sort(sorttemp(1,:));
    carnum=0;
    for j=1:2*windowsNum-1
        carnum=carnum+temp(2,index(j));
        if carnum>2
            time(i)=time(i)+2*(sortedtemp(j+1)-sortedtemp(j));
        else
            time(i)=time(i)+carnum*(sortedtemp(j+1)-sortedtemp(j));
        end
    end
end

    time=sum(time);


end

