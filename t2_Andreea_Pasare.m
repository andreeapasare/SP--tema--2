D=16;   %durata semnalului (numarul de ordine)
N = 50;       %numarul de coeficienti
P = 40; %perioada
fv=1/P;
t=-3*P:0.4:3*P;
w0 = 2*pi/P; 
x_triunghiular = sawtooth(2*pi*fv*t);        
f=@(t)sawtooth(2*pi*fv*t, 0.3);
CC=1/P*integral(f,0,P);
Ck=zeros(1,N);
Ak=zeros(1,N);
Xm=0;
for k=1:1:N
   f=@(t)sawtooth(2*pi*fv*t, 0.3).*exp(-2*pi*fv*t*1j*(k-25));
   Ck(k)=1/P*integral(f,0,P);             
   Ak(k+1)=2*abs(Ck(k));
   Xm=Xm+Ck(k)*exp(2*pi*fv*t*1j*(k-25));
end
figure(1);
plot(t,Xm,t,x_triunghiular);
figure(2)
Ak(26)=abs(CC);
Ak(1)=Ak(51);                    
stem(0:N,Ak);                     

%S-a initializat problema prin introducerea datelor (perioada, durata 
%semnalului, tipul semnalului, numarul de coeficienti)
%O proprietate a Seriei Fourier dovedeste faptul ca orice semnal periodic
%poate fi transformat intr-o suma de sinus si cosinus.

