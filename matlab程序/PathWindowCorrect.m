function [correctTimeWindow,aheadORdelayTime] = PathWindowCorrect(forward,backward,TimeWindow,type)
%UNTITLED3 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
dt=0.1;
correctTimeWindow=TimeWindow;
aheadORdelayTime=0;
if strcmp(type,'ahead')%�ж���������
    if ~isPathConfict( [forward;correctTimeWindow],backward )
        correctTimeWindow=TimeWindow;
        aheadORdelayTime=0;
    else
        while(isPathConfict( [forward;correctTimeWindow],backward ))%ѭ��������ÿ��-dt��ֱ���ҵ����ʵ�ʱ�䴰λ��
            correctTimeWindow=correctTimeWindow-dt;
            aheadORdelayTime=aheadORdelayTime+dt;
        end
    end
elseif strcmp(type,'delay')
    if ~isPathConfict( [forward;correctTimeWindow],backward )
        correctTimeWindow=TimeWindow;
        aheadORdelayTime=0;
    else
        while(isPathConfict( [forward;correctTimeWindow],backward ))
            correctTimeWindow=correctTimeWindow+dt;
            aheadORdelayTime=aheadORdelayTime+dt;
        end
    end
end

end

