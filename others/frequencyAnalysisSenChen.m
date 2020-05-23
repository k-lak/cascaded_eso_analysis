syms b11 b12 b13 b21 b22 b23 b31 b32 b33 U Y k1 k2 R hatg real
syms s

l1 = [b11; b12; b13];
l2 = [b21 b22 b23]';
l3 = [b31 b32 b33]';
A = [0 1 0; 0 0 1; 0 0 0];
b = [0 0 1]';
c = [1 0 0];
d = [0; 1; 0];

H1 = eye(3)*s - A + l1*c;
H2 = eye(3) * s - A + l2 * c;
H3 = eye(3) * s - A + l3 * c;

%% Control structure
% p = 1
F1b = s^3 + b11*s^2 + b12*s + b13;
F2b = s^3 + b21*s^2 + b22*s + b23;
F3b = s^3 + b31*s^2 + b32*s + b33;
Fk = s^2 + k2*s + k1;

XI1 = simplify(inv(H1)*(d*hatg*U+l1*Y));
aux = -XI1(3) - k1*(XI1(1) - R) -k2*(XI1(2)-s*R)+s^2*R;
Cu1 = simplify(coeffs(aux*F1b,U));
Cu1 = -Cu1(2)/hatg;
Cy1 = simplify(coeffs(aux*F1b,Y));
Cy1 = -Cy1(2);
Cr1 = simplify(coeffs(aux*F1b,R));
Cr1 = F1b*Cr1(2);

Gyu1 = -Cy1/(hatg*(F1b+Cu1));
Gru1 = Cr1/(hatg*(F1b+Cu1));
Gry1 = Cr1/(F1b*Fk);
Gdy1 = (F1b+Cu1)/(F1b*Fk);
P = simplify((F1b+Cu1)/(F1b*Fk-Cy1)); % tu cos nie tak
Gwy1 = s^2*(F1b+Cu1)/(F1b*Fk);

% p = 2
XI2 = inv(H2)*(d*hatg*U+d*b'*XI1+l2*c*XI1);
aux = -XI1(3) - XI2(3) - k1*(XI2(1) - R) -k2*(XI2(2)-s*R)+s^2*R;
Cu2 = simplify(coeffs(aux*F2b,U));
Cu2 = -Cu2(2)/hatg;
Cy2 = simplify(coeffs(aux*F2b,Y));
Cy2 = -Cy2(2);
Cr2 = simplify(coeffs(aux*F2b,R));
Cr2 = F2b*Cr2(2);

Gyu2 = -Cy2/(hatg*(F2b+Cu2));
Gru2 = Cr2/(hatg*(F2b+Cu2));
Gry2 = Cr2/(F2b*Fk);
Gdy2 = (F2b+Cu2)/(F2b*Fk);
P = 1/s^2; % tu cos nie tak
Gwy2 = s^2*(F2b+Cu2)/(F2b*Fk);

% p = 3
XI3 = inv(H3)*(d*hatg*U+d*b'*XI1+d*b'*XI2+l3*c*XI2);
aux = -XI1(3) - XI2(3) - XI3(3) - k1*(XI3(1) - R) -k2*(XI3(2)-s*R)+s^2*R;
Cu3 = simplify(coeffs(aux*F3b,U));
Cu3 = -Cu3(2)/hatg;
Cy3 = simplify(coeffs(aux*F3b,Y));
Cy3 = -Cy3(2);
Cr3 = simplify(coeffs(aux*F3b,R));
Cr3 = F3b*Cr3(2);

Gyu3 = -Cy3/(hatg*(F3b+Cu3));
Gru3 = Cr3/(hatg*(F3b+Cu3));
Gry3 = Cr3/(F3b*Fk);
Gdy3 = (F3b+Cu3)/(F3b*Fk);
P = 1/s^2; % tu cos nie tak
Gwy3 = s^2*(F3b+Cu3)/(F3b*Fk);

%% Plots
figure;
hold on
grid on

w01 = 400;
b11 = 3*w01;
b12 = 3*w01^2;
b13 = w01^3;
k1 = 4;
k2 = 4;
hatg = 1;
GdyRatio = char(Gdy2/Gdy1);
GwuRatio = char(Gyu2*Gwy2/(Gyu1*Gwy1));
Gwu1 = char(Gyu1*Gwy1);
Gyu1 = char(Gyu1);
Gru1 = char(Gru1);
Gry1 = char(Gry1);
Gdy1 = char(Gdy1);
Gwy1 = char(Gwy1);
s = tf('s');
bode(eval(Gwu1))

alpha = 2;
w01 = 75;
w02 = alpha * w01;
b11 = 3*w01;
b12 = 3*w01^2;
b13 = w01^3;
b21 = 3*w02;
b22 = 3*w02^2;
b23 = w02^3;
k1 = 4;
k2 = 4;
hatg = 1;
Gwu2 = char(Gyu2*Gwy2);
Gyu2 = char(Gyu2);
Gru2 = char(Gru2);
Gry2 = char(Gry2);
Gdy2 = char(Gdy2);
Gwy2 = char(Gwy2);
bode(eval(Gwu2));

alpha = 2;
w01 = 40;
w02 = alpha * w01;
w03 = alpha * w02;
b11 = 3*w01;
b12 = 3*w01^2;
b13 = w01^3;
b21 = 3*w02;
b22 = 3*w02^2;
b23 = w02^3;
b31 = 3*w03;
b32 = 3*w03^2;
b33 = w03^3;
k1 = 4;
k2 = 4;
hatg = 1;
Gwu3 = char(Gyu3*Gwy3);
Gyu3 = char(Gyu3);
Gru3 = char(Gru3);
Gry3 = char(Gry3);
Gdy3 = char(Gdy3);
Gwy3 = char(Gwy3);
% bode(eval(Gdy3));
legend('ESO, p=1', 'ESO, p=2', 'ESO, p=3')