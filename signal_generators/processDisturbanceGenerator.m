function [disturbance] = process_disturbance_generator(input)
    global ProcessDisturbance

    t = input(1);
    
    if(ProcessDisturbance.type == 1)
        if(t < ProcessDisturbance.step.time)
            disturbance = ProcessDisturbance.step.initialValue;
        else
            disturbance = ProcessDisturbance.step.finalValue;
        end
    elseif(ProcessDisturbance.type == 2)
        if(t > ProcessDisturbance.sine.startTime)
            disturbance = ProcessDisturbance.sine.amplitude*sin(ProcessDisturbance.sine.pulsation*t+ProcessDisturbance.sine.phase);
        else
            disturbance = 0;
        end
    end
end

