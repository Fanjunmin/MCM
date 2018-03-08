
Zpoint=[(3:8)];
G=BuildG(); %建图
[Ga,Gb,Gc]=BuildTimeG(G,position); %建时间图
[ga,gb,gc]=Sparse(Ga,Gb,Gc);
temperature = 100;                 % Initialize the temperature.
cooling_rate = 0.94;                % cooling rate
iterations = 1;                     % Initialize the iteration number.
maxIterations=inf;
Ratio=[0,0,1];
minTime=inf;


rand('seed',0);                    
%[tuplePath1,tuplePathNext,previous_Path, allPathTime,P_boolF]= GetPathAndTime(position);
%[previous_Path,allPathTime,P_boolF]=RandomPathAndTime(Ga,Gb,Gc);
previous_Path=PATH140;
%previous_exposeTime=TrueExposetime( previous_Path,G,position,Zpoint);
previous_exposeTime=TimePunish( previous_Path,G,position,Zpoint,Ratio);

%exposeTime(previous_Path,allPathTime)
%previous_exposeTime = exposeTime(previous_Path,allPathTime);
% This is a flag used to cool the current temperature after 100 iterations
temperature_iterations = 1;
% This is a flag used to plot the current route after 200 iterations
plot_iterations = 1;


DrawLines( previous_Path,G,position );

close all;
while 1 < temperature
    % generate randomly a neighbouring solution
    [temp_Path,Time,C_boolF] = Aperturb( previous_Path,ga,gb,gc,allPathTime,P_boolF,3,Zpoint);
    
    current_exposeTime=TimePunish( temp_Path,G,position,Zpoint,Ratio);
    
    %current_exposeTime=TrueExposetime( temp_Path,G,position,Zpoint);%exposeTime(temp_Path,Time)
    % compute total distance of the temp_route
    % compute change of distance
    diff = current_exposeTime - previous_exposeTime;
   
    
    % Metropolis Algorithm
    if (diff <= 0 )%|| (rand < exp(-40*diff/(temperature)))
        P_boolF=C_boolF;
        allPathTime=Time;
        previous_Path = temp_Path;         %accept new route
        previous_exposeTime = current_exposeTime;
        if previous_exposeTime<minTime
            minTime=previous_exposeTime;
            minPath=previous_Path;
        end
        
        % update iterations
        temperature_iterations = temperature_iterations + 1;
        plot_iterations = plot_iterations + 1;
        iterations = iterations + 1;
        
        %{
        DrawLines( previous_Path,G,position );
        xlabel(sprintf('iterations = %5i        Total exposeTime = %6.1f', ...
                       iterations,                  previous_exposeTime));
        plot_iterations = 0;
        drawnow
        break;
        %}
    end
    
    % reduce the temperature every 100 iterations
    if temperature_iterations >= 100
       temperature = cooling_rate*temperature;
       temperature_iterations = 0;
    end
    
    %  plot the current route every 200 iterations
    if plot_iterations >= 1
        
       
       DrawLines( previous_Path,G,position );
        xlabel(sprintf('iterations = %5i        Total Point = %6.1f', ...
                       iterations,                  previous_exposeTime));
       plot_iterations = 0; 
       drawnow
    end
    if iterations>maxIterations
          break;
    end
    
end
% plot the final solution
 
DrawLines( previous_Path,G,position );
xlabel(sprintf('iterations = %5i        Total Point = %6.1f', ...
                       iterations,                  previous_exposeTime));