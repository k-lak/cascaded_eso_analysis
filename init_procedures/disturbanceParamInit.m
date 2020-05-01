%% Disturbances
global ProcessDisturbance
ProcessDisturbance.enabled = 1; % Disturbance: 0 -off
                         %              1 - on
                         
ProcessDisturbance.type = 2;  % Type of disturbance: 1 - step value
                       %                      2 - sine wave 
% For step value:
ProcessDisturbance.step.time = 3.5;
ProcessDisturbance.step.initialValue = 0;
ProcessDisturbance.step.finalValue = 2.0;
% For sine wave:
ProcessDisturbance.sine.startTime = 3.5;
ProcessDisturbance.sine.amplitude = 5;
ProcessDisturbance.sine.pulsation = 9;
ProcessDisturbance.sine.phase = 0;

global OutputDisturbance
OutputDisturbance.enabled = 0; % Disturbance: 0 -off
                         %              1 - on
                         
OutputDisturbance.type = 2;  % Type of disturbance: 1 - step value
                       %                      2 - sine wave 
% For step value:
OutputDisturbance.step.time = 5;
OutputDisturbance.step.initialValue = 0;
OutputDisturbance.step.finalValue = 2.0;
% For sine wave:
OutputDisturbance.sine.startTime = 5;
OutputDisturbance.sine.amplitude = 0.5;
OutputDisturbance.sine.pulsation = 15;
OutputDisturbance.sine.phase = 0;