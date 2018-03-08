function [r,name,R] =PageRank(G,tuplePath,ptcn,d,e)
%PageRank算法
%d:阻尼系数; e:迭代终止条件
%R:影响力向量
PointFrequency = CountPF(tuplePath);
PointLastTime = countPLT(ptcn);
Matrix=FindMatrix(G,PointFrequency,PointLastTime);
[row,col]=size(Matrix);
R1=ones(col,1);
E=ones(col,1);
R=(1-d)*E+d*Matrix*R1;
while norm(R-R1)<=e
    R=(1-d)*E+d*Matrix*R;
end
[a,b]=sort(R);
r=[a(130),a(129),a(128),a(127),a(126)];
name=[PathNum2Name(b(130)),PathNum2Name(b(129)),PathNum2Name(b(128)),PathNum2Name(b(127)),PathNum2Name(b(126))];
end

