global Observer Sensor ProcessDisturbance ESO cascadedESO Plant Controller

% for ESO w0 = 3000,
% ESO, n=4, w0=430.1304
% ESO, n=5, w0 = 283.1419
% ESO, n= 6, w0 = 302.5756
init;
b_hat = Controller.adrc.inputMatrixEstimate;
B = Plant.dcdcBuckConverter.B;
A = Plant.dcdcBuckConverter.A;
Observer.type = 1;
Sensor.noise.enabled = 0;
ProcessDisturbance.enabled = 1;
w0 = 3000;
ESO.w0 = w0;
ESO.gainVectorN3 = [3*w0, 3*w0^2, w0^3]';
variantSystemsUpdate;
sim('ObserverTest.slx');
readLogsoutData;
realDisturbance = refSigSecondDerivative.Values.Data-(A(2,:)*(x.Values.Data(:,1:2))')'+(b_hat - B(2,:))*u.Values.Data-B(2,:)*dp.Values.Data;
desiredJd = sum(sqrt((z_hat.Values.Data(:,3)-realDisturbance).^2).*[diff(z_hat.Values.Time); 0]);
plotData;

Observer.type = 4;
variantSystemsUpdate;
w0 = 300;
ESO.gainVectorN4 = [4*w0, 6*w0^2, 4*w0^3, w0^4]';
ESO.gainVectorN5 = [5*w0, 10*w0^2, 10*w0^3, 5*w0^4, w0^5]';
ESO.gainVectorN6 = [6*w0, 15*w0^2, 20*w0^3, 15*w0^4, 6*w0^5, w0^6]';
sim('ObserverTest.slx');
readLogsoutData;
realDisturbance = refSigSecondDerivative.Values.Data-(A(2,:)*(x.Values.Data(:,1:2))')'+(b_hat - B(2,:))*u.Values.Data-B(2,:)*dp.Values.Data;
Jd = sum(sqrt((z_hat.Values.Data(:,3)-realDisturbance).^2).*[diff(z_hat.Values.Time); 0]);

while(abs(Jd-desiredJd) > 0.001 * abs(desiredJd))
    w0 = w0 - 0.005*(desiredJd - Jd);
    ESO.gainVectorN4 = [4*w0, 6*w0^2, 4*w0^3, w0^4]';
    ESO.gainVectorN5 = [5*w0, 10*w0^2, 10*w0^3, 5*w0^4, w0^5]';
    ESO.gainVectorN6 = [6*w0, 15*w0^2, 20*w0^3, 15*w0^4, 6*w0^5, w0^6]';
    sim('ObserverTest.slx');
    readLogsoutData;
    realDisturbance = refSigSecondDerivative.Values.Data-(A(2,:)*(x.Values.Data(:,1:2))')'+(b_hat - B(2,:))*u.Values.Data-B(2,:)*dp.Values.Data;
    Jd = sum(sqrt((z_hat.Values.Data(:,3)-realDisturbance).^2).*[diff(z_hat.Values.Time); 0]);
    disp(['Jd: ',num2str(Jd)]);
    disp(['desiredJd-Jd: ',num2str(desiredJd-Jd)]);
    disp(['w0: ',num2str(w0)]);
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