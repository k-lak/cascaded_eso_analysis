%% Observers
global Observer
Observer.type = 22; % 1 - ESO, n=3
                   % 2 - ESO, n=4
                   % 3 - ESO, n=5
                   % 4 - ESO, n=6
                   % 5 - CESO, p=2
                   % 6 - CESO, p=3
                   % 7 - CESO, p=4
                   % 8 - CESO, p=5 
                   % 9 - lumped CESO, p=2
                   % 10 - lumped CESO, p=3
                   % 11 - lumped CESO, p=4
                   % 12 - lumped CESO, p=5
                   % 13 - CESO with controller terms
                   % 14 - CESO, p=2, no filtering
                   % 15 - CESO, p=3, no filtering
                   % 16 - RESO
                   % 17 - Astolfi/Marconi observer, n=3
                   % 18 - Astolfi/Marconi observer, n=5
                   % 19 - Astolfi/Marconi RESO
                   % 20 - TESO, n=3
                   % 21 - NESO, n=3
                   % 22 - cascade RESO, p=2
% ESO Properties
global ESO
w0 = 460;
ESO.w0 = w0;
ESO.gainVectorN3 = [3*w0, 3*w0^2, w0^3]';
ESO.gainVectorN4 = [4*w0, 6*w0^2, 4*w0^3, w0^4]';
ESO.gainVectorN5 = [5*w0, 10*w0^2, 10*w0^3, 5*w0^4, w0^5]';
ESO.gainVectorN6 = [6*w0, 15*w0^2, 20*w0^3, 15*w0^4, 6*w0^5, w0^6]';

global cascadedESO
alpha = 2;
w01 = 460/4;
w02 = alpha*w01;
w03 = alpha*w02;
w04 = alpha*w03;
w05 = alpha*w04;
cascadedESO.gainVectorFirst = [3*w01, 3*w01^2, w01^3]';
cascadedESO.gainVectorSecond = [3*w02, 3*w02^2, w02^3]';
cascadedESO.gainVectorThird = [3*w03, 3*w03^2, w03^3]';
cascadedESO.gainVectorFourth = [3*w04, 3*w04^2, w04^3]';
cascadedESO.gainVectorFifth = [3*w05, 3*w05^2, w05^3]';

global controllerTermCascadedESO
alpha = 2;
w01 = 460/4;
w02 = alpha*w01;
controllerTermCascadedESO.gainVectorFirst = [3*w01, 3*w01^2, w01^3]';
controllerTermCascadedESO.gainVectorSecond = [3*w02, 3*w02^2, w02^3]';
wc = 46;
controllerTermCascadedESO.controllerGains = [wc^2 2*wc];


% RESO Properties
global RESO
w0 = 460;
RESO.w0 = w0;
RESO.gainVectorN5 = [5*w0, 10*w0^2, 10*w0^3, 5*w0^4, w0^5]';
RESO.pulsation = 15;

% cascade RESO Properties
global cascadeRESO
alpha = 1.5;
w01 = 200;
w02 = alpha * w01;
cascadeRESO.w01 = w01;
cascadeRESO.w02 = w02;
cascadeRESO.gainVectorFirst = [5*w01, 10*w01^2, 10*w01^3, 5*w01^4, w01^5]';
cascadeRESO.gainVectorSecond = [5*w02, 10*w02^2, 10*w02^3, 5*w02^4, w02^5]';
cascadeRESO.pulsationFirst = 15;
cascadeRESO.pulsationSecond = 30;


%% Astolfi/Marconi observers properties
global amESO 
amESO.l = 1057.46;
amESO.K1n3 = [0.8 12/25];
amESO.K2n3 = [0.8 4/25];
amESO.K1n5 = [0.6 0.36];
amESO.K2n5 = [0.6 0.135];
amESO.K3n5 = [0.6 0.06];
amESO.K4n5 = [0.6 0.0225];
C = [1 0];
B = [0; 1];
I = eye(2);
L1 = blkdiag(C, I);
L2 = blkdiag(I, B');
amESO.Ln3 = L2;
L1 = blkdiag(C, C, C, I);
L2 = blkdiag(I, B', B', B');
amESO.Ln5 = L2;

global amRESO
amRESO.l = 1040.34;
amRESO.pulsation = 15;
amRESO.K1 = [0.6 0.36];
amRESO.K2 = [0.6 0.135];
amRESO.K3 = [0.6 0.06];
amRESO.K4 = [0.6 0.0225];
L1 = blkdiag(C, C, C, I);
L2 = blkdiag(I, B', B', B');
amRESO.L = L2;


% TESO (Wei Wei and Wenchao paper)
global TESO
w0 = 460;
TESO.w0 = w0;
TESO.gainVectorN3 = [3*w0, 3*w0^2, w0^3]';
TESO.rhoZero = 1;
TESO.rhoInfty = 0.35;
TESO.l = 1;

% NESO - Alexis Ball/Khalil Paper - something strange is going on - maybe its
% due to the error-domain definition of observer extended state?
global NESO
w0L = 50;
w0H = 500;
NESO.w0L = w0L;
NESO.w0H = w0H;
NESO.d = 0.000001;