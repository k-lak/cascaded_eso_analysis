%% Reference signal
global RefSig
RefSig.type = 1;  % Type of reference signal: 1 - step
                  %                           2 - sine wave 
                  %                           3 - pulse
% For constant value: refSig = k
RefSig.step.time = 1.0; % step time
RefSig.step.initialValue = 0; % initial step value
RefSig.step.finalValue = 0;%10; % final step value
RefSig.step.filter.numerator = 1;
RefSig.step.filter.denominator = 1;%[0.03^5 5*0.03^4 10*0.03^3 10*0.03^2 5*0.03 1];

% For sine wave: refSig = A*sin(w*t+phi)
RefSig.sine.amplitude = 1;
RefSig.sine.pulsation = 3.14;
RefSig.sine.bias = 0;
RefSig.sine.phase = 0;

% For pulse wave:
RefSig.pulse.lowValue = 5;
RefSig.pulse.highValue = 15;
RefSig.pulse.period = 1; %[s]
RefSig.pulse.width = 0.5; % in [0,1]