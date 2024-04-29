
function tf_aprox = CHEN1_3 (Amplitud, t, y, t_inic, retardo, last)
    
[val, lugar]=min(abs((t_inic+retardo)-t));
y_t1=y(lugar);
t_t1=t(lugar);

[val, lugar]=min(abs(2*t_inic+retardo-t));
y_2t1=y(lugar);
t_2t1=t(lugar);

[val, lugar]=min(abs(3*t_inic+retardo-t));
y_3t1=y(lugar);
t_3t1=t(lugar);

K=last/Amplitud;
k1=(1/Amplitud)*y_t1/K-1;
k2=(1/Amplitud)*y_2t1/K-1;
k3=(1/Amplitud)*y_3t1/K-1;

b=4*k1^3*k3-3*k1^2*k2^2-4*k2^3+k3^2+6*k1*k2*k3;

a1=(k1*k2+k3-sqrt(b))/(2*(k1^2+k2));
a2=(k1*k2+k3+sqrt(b))/(2*(k1^2+k2));
beta=(k1+a2)/(a1-a2);

T1_ang=-t_inic/log(a1);
T2_ang=-t_inic/log(a2);
T3_ang=beta*(T1_ang-T2_ang)+T1_ang;
T1(1)=T1_ang;
T2(1)=T2_ang;
T3(1)=T3_ang;
T3_ang=sum(T3/length(T3));
T2_ang=sum(T2/length(T2));
T1_ang=sum(T1/length(T1));

tf_aprox=tf(K*[T3_ang 1],conv([T1_ang 1],[T2_ang 1]));
end


