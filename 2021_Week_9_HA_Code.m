

%%  Ex. 4.6
clear all;clc
A = [5 0.2 0.3 0 0 0;
    0 5 0 0.2 0.3 0;
    0 0 5 0 0.2 0.3;
    0.24 0.98 0 0 0 0;
    0 0.24 0 0.98 0 0;
    0 0 0 0 0.98 0;
    0.28 0 0.83 0 0 0;
    0 0.28 0 0 0.83 0;
    0 0 0.28 0 0 0.83];
Z =[0.5 0 0 0 0.5 0 0 0 0.5]';
I =inv(A'*A)*A'*Z;
I'
  
%% Ex. 4.8 Gauss Data
clear all; clc
LW = 'linewidth';
% Data 
DataR =[6800; 6800;6830; 6900];
DataS = [0; 0.5; 1.0; 1.5];
Data =[DataS DataR];
figure(1)
plot(Data(:,1),Data(:,2),'ro', LW,2);grid on;hold on


syms a e th thP
R = @(a,e,th,thP) a/(1+e*cos(th-thP));
% Gradient 
H = [diff(R,a) diff(R,e)  diff(R,thP)];

% calculate the error with the first estimator
estX =[6900;0.02;0.01];  %[a e thP]
Z =[ ];
JA = [ ];
for k = 1:4
    for i = 1:4
        Z=[Z; Data(i,2) - subs(R,[a,e,thP,th],[estX(1), estX(2),estX(3) Data(i,1)])];
        JA =[JA;subs(H, [a,e,thP,th],[estX(1), estX(2),estX(3),Data(i,1)])];     
    end 
  JA = double(JA);
  PseJA = inv(JA'*JA)*JA';  
  estX =estX +PseJA*Z;
  estX = double(estX);
  Z = [ ];
  JA =[ ];
end
  
  %
  a = estX(1);
  e= estX(2);
  thP = estX(3);
  
  th= linspace(0,1.5, 100);
  estX = a./(1+e.*cos(th-thP));
  
  plot(th,estX) 
  
  %% 
  clear al; clc
  
  x1 =[2 0 1 0 2]';
  u1 = x1/sqrt((x1'*x1))
  v2 = [1 sqrt(3) 1 0 0]';
  x2 = v2 - v2'*u1*u1;
  u2 = x2/sqrt(x2'*x2)
  v3 =[0 6 0 -3 0]';
  x3 = v3-v3'*u1*u1 - v3'*u2*u2;
  u3  = x3/(sqrt(x3'*x3));
  x =[4 6 1 -7 -8]';
  estX = x'*u1*u1 + x'*u2*u2+x'*u3*u3
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  