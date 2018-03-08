function [tuplePath,Time,boolF] = Aperturb( tuplePath,ga,gb,gc,Time,boolF,number,Zpoint)
%UNTITLED4 此处显示有关此函数的摘要
%   此处显示详细说明
p=randperm(24);
for i=1:8
    boolF(i)=0;
end
for i=1:number
    index(i)=p(i);
    previous{i}=tuplePath{index(i)};
    length(i)=size(previous{i},2);
end

for i=1:number
    for j=1:length(i)
        if previous{i}(j)>=9 & previous{i}(j)<=68
            boolF(previous{i}(j))=1;
        end
    end
end

for i=1:number
    
    d=previous{i}(1);
        if Rank2Type(index(i))=='a'
            g=ga;
        elseif Rank2Type(index(i))=='b'
            g=gb;
        else
            g=gc;
        end
    
    indexBol=find(boolF==1);
    emptylength=size(indexBol,2);
    id=randperm(emptylength);
    x=indexBol(id(1));y=indexBol(id(2));
    boolF(x)=0;
    boolF(y)=0;
    
    Zlength=size(Zpoint,2);
    id=randperm(Zlength);
    z=Zpoint(id(1));
    gr=1+rand(130,130);
    g=g.*gr;
    [Dist,Path1]=graphshortestpath(g,d,x,'Method','Dijkstra');
    [Dist2,Path2]=graphshortestpath(g,x,z,'Method','Dijkstra');
    [Dist3,Path3]=graphshortestpath(g,z,y,'Method','Dijkstra');
    Time(index(i))=Dist+Dist2+Dist3;
    tuplePath{index(i)}=[Path1,Path2(2:end),Path3(2:end)];

end


end

