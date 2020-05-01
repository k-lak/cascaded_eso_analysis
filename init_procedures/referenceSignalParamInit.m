%% Reference signal
global RefSig
RefSig.type = 2;  % Type of reference signal: 1 - step
                  %                           2 - sine wave 
                  %                           3 - pulse
% For constant value: refSig = k
RefSig.step.time = 0.25; % step time
RefSig.step.initialValue = 0; % initial step value
RefSig.step.finalValue = 1; % final step value
RefSig.step.filter.numerator = 1;
RefSig.step.filter.denominator = [0.1^5 5*0.1^4 10*0.1^3 10*0.1^2 5*0.1 1];

% For sine wave: refSig = A*sin(w*t+phi)
RefSig.sine.amplitude = 1;
RefSig.sine.pulsation = 1;
RefSig.sine.phase = 0;

% For pulse wave:
RefSig.pulse.lowValue = -1;
RefSig.pulse.highValue = 1;
RefSig.pulse.period = 5; %[s]
RefSig.pulse.width = 0.5; % in [0,1]