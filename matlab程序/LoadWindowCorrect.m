function [ZtimeWindow,delayTime]=LoadWindowCorrect(ZtimeWindow,index,loadTime)
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
dt=0.00167;
correctTime=loadTime;
while(isloadConfict([ZtimeWindow{index};correctTime]))
    correctTime=correctTime+dt;
end
ZtimeWindow{index}=[ZtimeWindow{index};correctTime];
delayTime=correctTime(1)-loadTime(1);
end

