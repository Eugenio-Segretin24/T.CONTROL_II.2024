clear;close all;
X=[0; 0];i=0;
t_etapa=1e-7; %Valor cercano al calculado con los polos de la funcion
tF=0.01;A=12;
color_='r';
t=0:t_etapa:tF;
f=300;
u=A*square(2*pi*f*t); %12 Voltios de señal cuadrada
plot(t,u),grid on;
 for t=0:t_etapa:tF
  i=i+1;
  X=ModRLC(t_etapa, X, u(i)); 
  x1(i)=X(1);%CORRIENTE EN L
  x2(i)=X(2);%TENSION EN C
  acc(i)=u(i);
 end
 
[z1]=xlsread('Curvas_Medidas_RLC');
 t0=z1(:,1);
 y=z1(:,3);
  t=0:t_etapa:tF;
  subplot(3,1,1);hold on;
  plot(t,x1,color_);title('CORRIENTE');
  subplot(3,1,3);hold on;
  plot(t,acc,color_);title('TENSION');
  xlabel('Tiempo [Seg.]');
  subplot(3,1,2);hold on;
  plot(t,x2,color_);title('VC');



