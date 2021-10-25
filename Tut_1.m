

%% data  representation
% assume you may want a plot f(x) = x^2,  over x in [ -2 5]
% you may code as

clear all;    % delete the memory in your workspace
LW ='LineWidth';
x = linspace(-2, 5,100);     % sampling points
figure(1)
f = x.^2                      % f is a function of x
plot(f,LW,2); grid on

%% data representation - anonymous function

h = @(x)  x.^2;
x = linspace(-2,5,10);
plot(h(x),LW,2); grid on

%% if you want what data in code are as
whos
x
plot(x,h(x)); grid on

%% symbolic variables  
% in data representation, there are the "value" of the variable at the
% specific points, (it may be called as the sampling points in "digital
% signal process"). Without the specific points(the sampling points) is sometime useful to
% analyze the mathmetiacal expressions. See the following

clear all; clc;clf;
LW = 'LineWidth';
% define  a symbolic variable
syms x    
g = x^2;
fplot(g,[-2 5],LW,2); grid on

%% 
% The plot looks like the previous one, however, there is no sampling points.
% If the sampling point is given , x=2, substitue cmd subs gives 

subs(g,x,2)

% Or the sampling point are multiple as previous,  
subs(g,x,linspace(-2,5,10))
% whose the same results in the case of vector .


%% symbolic function - one variable
% define symbolic functions 

syms f(x)
f(x)= x^2;
figure(2)
fplot(f,[-2 5]); grid on

% to get the values of the function at the sampling points
f(linspace(-2,5,10))

%% symboloc - trigonometric function

clear all; clc
syms x
LW ='LineWidth';

f = sin(x);
g =sin(x)^2 ;
h = sin(x^2);
domain = [0 pi];
fplot(f, domain,LW,2); hold on; grid on
fplot(g,domain,LW,2);
fplot(h,domain,LW,2)


%% One of the diffrences between data type and symbolic type
% To plot an anonymous function, define your function of variables and  simultaneously 
% define the value of the varibles.However to plot  a symbolic function, define your function and plot
% without the values of the variables. If you need function values, you may
% substitute the values to your function !! 

%% symbolic  : Differentiation i one variable  (1-23)
% You know d(x^3)/dx  = 3x^2 . In this case you do not need to define the sampling
% points. This is same in the symbolic math. 

clear all;
syms x
f = sin(x)^2;
diff(f)          % the first derivative   df/dx 

diff(f,2)        % the second derivative  d^2f /dx^2 

%% symbolic : Partial derivatives
clear all;
syms x y
f = sin(x)^2  + cos(y)^2 ;
diff(f,x)
diff(f,y)

%% symbolic :  Second partial and Mixed Derivatives(1-24)

clear all 
syms x y
f = sin(x)*cos(y);
diff(f,y,2)    % 

diff(diff(f,y),x)
diff(diff(f,x),y)


%% symbolic: Integral 
% indefinite integral one ot multivariables

clear all; clc
LW = 'LineWidth';
syms x
f = sin(x);
g = sin(x)^2;
h = sin(x^2);
int(f)      
fplot(int(f),LW,2); hold on; grid on
int(g)
fplot(int(g),LW,2); 
int(h)
fplot(int(h),LW,2);
hold off


