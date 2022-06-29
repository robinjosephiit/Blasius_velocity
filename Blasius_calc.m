clc;clear all;
blasius=dlmread('falksn0.0smax.txt');

T=10; % Temperature in degree celsius
Pr=90.9;   % Pressure in Kilo-pascals
density=(Pr*1000/287)/((T+273)); %Calculation of density
viscosity=((1.458e-6)*(T+273)^(1.5))/(110.4+(T+273));% Dynamic viscosity
nu=viscosity/density;% Kinematic viscosity

Uinf=12.2; % Change free stream velocity here
X=300; % Set X-location here

step=0.915/1000; % Set height for local velocity calculation
d1=nu*(X/1000)/(Uinf);d2=sqrt(d1);
delstar=1.72*d2; %Calculating displacement thickness
delta=4.91*d2; %Calculating 99% boundary layer thickness
kbydel=step/delta;
ybydel=step/delstar;

for i=1:length(blasius)
    if blasius(i,1)<ybydel && blasius(i+1,1)>ybydel
        loc=i;
        ulocnorm=blasius(i,2);
        break;
    end
end
uloc=ulocnorm*Uinf; % Local velocity found

Rek=uloc*step/nu; % Reynolds number based on height and Local velocity
Reinf=Uinf*step/nu; % Reynolds number based on height and free-stream velocity
 
f=650;Strouhal=f*step/uloc;%Strouhal Number calculation



 

 