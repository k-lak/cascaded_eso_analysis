global Observer Sensor ProcessDisturbance ESO cascadedESO Plant Controller

% for ESO w0 = 3000,
% CESO, p=2, w01 = 371
% CESO, p=3, w01 = 193.274
% CESO, p=4, w01 = 142.0993
% CESO, p=5, w01 = 99.0583
init;
b_hat = Controller.adrc.inputMatrixEstimate;
B = Plant.dcdcBuckConverter.B;
A = Plant.dcdcBuckConverter.A;
Observer.type = 1;
Sensor.noise.enabled = 0;
ProcessDisturbance.enabled = 1;
w0 = 3000;
ESO.w0 = w0;
ESO.gainVector = [3*w0, 3*w0^2, w0^3]';
variantSystemsUpdate;
sim('ObserverTest.slx');
readLogsoutData;
realDisturbance = refSigSecondDerivative.Values.Data-(A(2,:)*(x.Values.Data(:,1:2))')'+(b_hat - B(2,:))*u.Values.Data-B(2,:)*dp.Values.Data;
desiredJd = sum(sqrt((z_hat.Values.Data(:,3)-realDisturbance).^2).*[diff(z_hat.Values.Time); 0]);
plotData;

Observer.type = 8;
variantSystemsUpdate;
w01 = 99.06;
w02 = 2*w01;
w03 = 2*w02;
w04 = 2*w03;
w05 = 2*w04;
cascadedESO.gainVectorFirst = [3*w01, 3*w01^2, w01^3]';
cascadedESO.gainVectorSecond = [3*w02, 3*w02^2, w02^3]';
cascadedESO.gainVectorThird = [3*w03, 3*w03^2, w03^3]';
cascadedESO.gainVectorFourth = [3*w04, 3*w04^2, w04^3]';
cascadedESO.gainVectorFifth = [3*w05, 3*w05^2, w05^3]';
sim('ObserverTest.slx');
readLogsoutData;
realDisturbance = refSigSecondDerivative.Values.Data-(A(2,:)*(x.Values.Data(:,1:2))')'+(b_hat - B(2,:))*u.Values.Data-B(2,:)*dp.Values.Data;
Jd = sum(sqrt((z_hat.Values.Data(:,3)-realDisturbance).^2).*[diff(z_hat.Values.Time); 0]);

while(abs(Jd-desiredJd) > 0.001 * abs(desiredJd))
    w01 = w01 - 0.0005*(desiredJd - Jd);
    w02 = 2*w01;
    w03 = 2*w02;
    w04 = 2*w03;
    w05 = 2*w04;
    cascadedESO.gainVectorFirst = [3*w01, 3*w01^2, w01^3]';
    cascadedESO.gainVectorSecond = [3*w02, 3*w02^2, w02^3]';
    cascadedESO.gainVectorThird = [3*w03, 3*w03^2, w03^3]';
    cascadedESO.gainVectorFourth = [3*w04, 3*w04^2, w04^3]';
    cascadedESO.gainVectorFifth = [3*w05, 3*w05^2, w05^3]';
    sim('ObserverTest.slx');
    readLogsoutData;
    realDisturbance = refSigSecondDerivative.Values.Data-(A(2,:)*(x.Values.Data(:,1:2))')'+(b_hat - B(2,:))*u.Values.Data-B(2,:)*dp.Values.Data;
    Jd = sum(sqrt((z_hat.Values.Data(:,3)-realDisturbance).^2).*[diff(z_hat.Values.Time); 0]);
    disp(['Jd: ',num2str(Jd)]);
    disp(['desiredJd-Jd: ',num2str(desiredJd-Jd)]);
    disp(['w01: ',num2str(w01)]);
end
plotData;

% Observer.type = 1;
% Sensor.noise.enabled = 0;
% variantSystemsUpdate;
% sim('ObserverTest.slx');
% readLogsoutData;
% plotData;
% 
% Observer.type = 6;
% Sensor.noise.enabled = 0;
% variantSystemsUpdate;
% sim('ObserverTest.slx');
% readLogsoutData;
% plotData;