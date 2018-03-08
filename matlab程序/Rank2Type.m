function [type]=Rank2Type(i)
if (i<=6 & i>=1)|(i<=18 & i>=13) %≈–∂œ≥µ÷÷¿‡
    type = 'c';
elseif(i<=9 & i>=7)|(i<=21 & i>=19)
    type = 'b';
else
type = 'a';
end
end