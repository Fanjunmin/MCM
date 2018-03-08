function [correctTimeWindow,aheadORdelayTime] = PathWindowCorrect(forward,backward,TimeWindow,type)
%UNTITLED3 此处显示有关此函数的摘要
%   此处显示详细说明
dt=0.1;
correctTimeWindow=TimeWindow;
aheadORdelayTime=0;
if strcmp(type,'ahead')%判断修正类型
    if ~isPathConfict( [forward;correctTimeWindow],backward )
        correctTimeWindow=TimeWindow;
        aheadORdelayTime=0;
    else
        while(isPathConfict( [forward;correctTimeWindow],backward ))%循环遍历，每次-dt，直到找到合适的时间窗位置
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

