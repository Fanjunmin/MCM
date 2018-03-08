function [Ga,Gb,Gc]=BuildTimeG(G,position) 
Ga=zeros(130,130);
Gb=zeros(130,130);
Gc=zeros(130,130);
for i=1:130
    for j=1:130
        dist = norm(position(i,:)-position(j,:));
        if(G(i,j)==1)
            Ga(i,j)=dist/45;
            Gb(i,j)=dist/35;
            Gc(i,j)=dist/30;
        elseif(G(i,j)==2)
            Ga(i,j)=dist/70;
            Gb(i,j)=dist/60;
            Gc(i,j)=dist/50;
        else
            Ga(i,j)=0;
            Gb(i,j)=0;
            Gc(i,j)=0;
        end
    end
end
end