%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Author: Krzysztof Lakomy
%% e-mail: krzysztof.lakomy92@gmail.com
%% January, 2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
% close all 
clc

addpath('plant',...
        'observers',...
        'data_analysis',...
        'controller',...
        'signal_generators',...
        'math',...
        'simulation_procedures',...
        'init_procedures');
    
simulationParamInit;
referenceSignalParamInit;
observerParamInit;
controllerParamInit;
disturbanceParamInit;
controlObjectParamInit;
sensorParamInit;
variantSystemsUpdate;