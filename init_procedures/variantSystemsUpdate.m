assignin('base','OBSERVER_TYPE', Observer.type);                   
assignin('base','ESO_OBSERVER', Simulink.Variant('OBSERVER_TYPE==1'));
assignin('base','NEW_ESO_OBSERVER_N2', Simulink.Variant('OBSERVER_TYPE==5'));
assignin('base','NEW_ESO_OBSERVER_N3', Simulink.Variant('OBSERVER_TYPE==6'));
assignin('base','ESO_OBSERVER_N6', Simulink.Variant('OBSERVER_TYPE==4'));
assignin('base','NEW_ESO_OBSERVER_N4', Simulink.Variant('OBSERVER_TYPE==7'));
assignin('base','NEW_ESO_OBSERVER_N5', Simulink.Variant('OBSERVER_TYPE==8'));
assignin('base','ESO_OBSERVER_N4', Simulink.Variant('OBSERVER_TYPE==7'));
assignin('base','ESO_OBSERVER_N5', Simulink.Variant('OBSERVER_TYPE==8'));

assignin('base','PROCESS_DISTURBANCE_ENABLED', ProcessDisturbance.enabled);                   
assignin('base','PROCESS_DISTURBANCE_OFF', Simulink.Variant('PROCESS_DISTURBANCE_ENABLED==0'));
assignin('base','PROCESS_DISTURBANCE_ON', Simulink.Variant('PROCESS_DISTURBANCE_ENABLED==1'));

assignin('base','OUTPUT_DISTURBANCE_ENABLED', OutputDisturbance.enabled);                   
assignin('base','OUTPUT_DISTURBANCE_OFF', Simulink.Variant('OUTPUT_DISTURBANCE_ENABLED==0'));
assignin('base','OUTPUT_DISTURBANCE_ON', Simulink.Variant('OUTPUT_DISTURBANCE_ENABLED==1'));

assignin('base','DEADTIME_ENABLED', Controller.deadTime.enabled);                   
assignin('base','DEADTIME_OFF', Simulink.Variant('DEADTIME_ENABLED==0'));
assignin('base','DEADTIME_ON', Simulink.Variant('DEADTIME_ENABLED==1'));

assignin('base','CONTROL_SIGNAL_SATURATION_ENABLED', Plant.controlSignalSaturation.enabled);                   
assignin('base','CONTROL_SIGNAL_SATURATION_ON', Simulink.Variant('CONTROL_SIGNAL_SATURATION_ENABLED==1'));
assignin('base','CONTROL_SIGNAL_SATURATION_OFF', Simulink.Variant('CONTROL_SIGNAL_SATURATION_ENABLED==0'));

assignin('base','SENSOR_NOISE_ENABLED', Sensor.noise.enabled);                   
assignin('base','SENSOR_NOISE_OFF', Simulink.Variant('SENSOR_NOISE_ENABLED==0'));
assignin('base','SENSOR_NOISE_ON', Simulink.Variant('SENSOR_NOISE_ENABLED==1'));

assignin('base','SENSOR_QUANTIZATION_ENABLED', Sensor.quantization.enabled);                   
assignin('base','SENSOR_QUANTIZATION_OFF', Simulink.Variant('SENSOR_QUANTIZATION_ENABLED==0'));
assignin('base','SENSOR_QUANTIZATION_ON', Simulink.Variant('SENSOR_QUANTIZATION_ENABLED==1'));

assignin('base','SENSOR_SAMPLING_ENABLED', Sensor.sampling.enabled);                   
assignin('base','SENSOR_SAMPLING_OFF', Simulink.Variant('SENSOR_SAMPLING_ENABLED==0'));
assignin('base','SENSOR_SAMPLING_ON', Simulink.Variant('SENSOR_SAMPLING_ENABLED==1'));