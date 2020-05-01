%% ADRC Params
global Controller
Controller.adrc.inputMatrixEstimate = 1;
Controller.adrc.gainMatrix = [4 4];
Controller.deadTime.enabled = 0;
Controller.deadTime.time = 1;