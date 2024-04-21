function [X]=ModRLC(t_etapa, xant, accion)
R=4.7e3; L=10e-6; C=100e-9;
A=[-R/L -1/L;1/C 0]; 
B=[1/L;0];
h=2.13e-10;
x= xant;
u= accion; %acciona desde el programa principal 
for i=0:h:t_etapa
xp = A*x + B*u;
x = x + h*xp; %integro x
end
X=x;