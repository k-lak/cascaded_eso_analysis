%% Sensor parameters
global Sensor
Sensor.noise.enabled = 0;       % Noise: 0 - off
                                %        1 - on
Sensor.noise.power = 1e-10;  % Power of band-limited white noise
Sensor.noise.Ts = 0.01;        % Sampling time of noise
Sensor.noise.seed = 21000;
Sensor.quantization.enabled = 0;    % Quantization: 0 - off
                                    %               1 - on
Sensor.quantization.interval = 1e-2;
Sensor.sampling.enabled = 0;   % Sampling: 0 - off
                               %           1 - on
Sensor.sampling.rate = Sensor.noise.Ts;