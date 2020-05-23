clear all
close all
t=[0:0.00005:10];  %time
x=zeros(3,length(t));  %state
n_eso=zeros(3,length(t)); % state of 1st ESO
c_eso=zeros(3,length(t)); % state of 2nd ESO
A=[0 1 0;
    0 0 1;
    0 0 0;];

x(:,1)=[1;1;0];             %intial value  of state
n_eso(:,1)=[1;0;0];         %intial value  of state of 1st ESO
c_eso(:,1)=[1;0;0];         %intial value  of state  of 2nd ESO
h=t(2)-t(1); %sampling time

w=10;  % ESO's bandwidth
b1=3*w;
b2=3*w^2;
b3=1*w^3;
alpha = 2;
b21 = 3*(alpha*w);
b22 = 3*(alpha*w)^2;
b23 = (alpha*w)^3;
L1=[b1;b2;b3];
L2=L1;
%[b4;b5;b3];
w_n=10;  %noise's frequency
d_n=0;  %disturbance's frequency
f=0*t;   %total disturbance

for i=1:1:length(t)-1
 f(i)=2*sin(2*pi*d_n*t(i));  % disturbance 
    
 x(:,i+1)=x(:,i)+h*(A*x(:,i)+[0;0;1]*f(i)); % system's update
 
 y=x(1,i)+sin(2*pi*w_n*t(i))*0.1;  %measurement+noise
  
 n_eso(:,i+1)=n_eso(:,i)+h*( A*n_eso(:,i)+L1*(y-n_eso(1,i)) );  % 1st ESO update
 
 c_eso(:,i+1)=c_eso(:,i)+h*( A*c_eso(:,i)+[0;1;0]*n_eso(3,i)+L2*(n_eso(1,i)-c_eso(1,i)) );  %2nd ESO update
 
end
figure, plot(t,x(1,:),'r',t,n_eso(1,:),'b:');legend('actual state','estimation of state')
figure, plot(t,f-n_eso(3,:),'b',t,f-n_eso(3,:)-c_eso(3,:),'r');ylabel('estimation error of disutrbnace'),legend('normal ESO','cascade ESO'),xlabel('time(s)')