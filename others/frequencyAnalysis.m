syms b11 b12 b13 b21 b22 b23 U Y k1 k2 R hatg real
syms s

l1 = [b11; b12; b13];
l2 = [b21 b22 b23]';
A = [0 1 0; 0 0 1; 0 0 0];
b = [0 0 1]';
c = [1 0 0];
d = [0; 1; 0];

H1 = eye(3)*s - A + l1*c;
H2 = eye(3) * s - A + l2 * c;

Gxi2d = simplify(inv(H2)*(l2-b*b13)*c*inv(H1)*b*s + inv(H2)*b*s);
Gxi2w = simplify(-inv(H2)*(l2-b*b13)*c*inv(H1)*l1-inv(H2)*b*b13);

%% Wenchao TFs
pol1 = ((s^2 + b21*s+b22)*(s^3+b11*s^2+b12+b13)+(-b22*b23-b21*b23*s))*s;
pol3 = (b13*(s^2 + b21*s+b22)*(s^3+b11*s^2+b12+b13)+(-b22*b23-b21*b23*s)*(-b11*s^2-b12*s-b13));
pol2 = (s^3+b21*s^2+b22*s+b23)*(s^3+b11*s^2+b12+b13);

numeratorG2d = flip([ 0 coeffs(pol1,s)]);
numeratorG2w = flip(coeffs(pol3,s));
denominatorG2d = flip(coeffs(pol2,s));

alpha = 1;
w01 = 200;
w02 = alpha * w01;
b11 = 3*w01;
b12 = 3*w01^2;
b13 = w01^3;
b21 = 3*w02;
b22 = 3*w02^2;
b23 = w02^3;

G1d = tf([1 b11 b12 0],[1 b11 b12 b13]);
G2d = tf(eval(numeratorG2d),eval(denominatorG2d));

G1w = tf([-b13 0 0],[1 b11 b12 b13]);
G2w = tf(eval(numeratorG2w),eval(denominatorG2d));

alpha = 1;
w01 = 100;
w02 = alpha * w01;
b11 = 3*w01;
b12 = 3*w01^2;
b13 = w01^3;
b21 = 3*w02;
b22 = 3*w02^2;
b23 = w02^3;
TFstr = char(Gxi2d(3));
TFstr2 = char(Gxi2w(3));
s = tf('s');


figure;
bode(G1d)
hold on
grid on
% bode(G2d)
bode(eval(TFstr));
legend('ESO, p=1', 'ESO, p=2')
% 
% 
figure;
bode(G1w)
hold on
grid on
% bode(G2w)
bode(eval(TFstr2))
legend('ESO, p=1', 'ESO, p=2')