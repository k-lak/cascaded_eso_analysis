%% Control object properties, G(s) = 1/(s+1)^2
global Plant
Plant.A = [0 1;...
    -1 -2];
Plant.B = [0;1];
Plant.C = [1 0];
Plant.x0 = [0 0]; % Initial conditions
Plant.controlSignalSaturation.enabled = 0; % 0 - off 
                                           % 1 - on
Plant.controlSignalSaturation.upperLimit = 10;
Plant.controlSignalSaturation.lowerLimit = -10;