% Set clear & Initialization
clear variables; close all; clc;

N = 1000000; % Generating samples for simulation % 

% Two independent Gaussian random variables with zero mean and unit variance % 
x = randn(1,N); 
y = randn(1,N); 
R = sqrt(0.5*(x.^2 + y.^2)); % Rayleigh fading envelope % 

% Defining bin steps and range for histogram curve 
% step = 0.1; 
step = 0.1; 
range = 0:step:3; 

h = histogram(R,range);
c = h.Values;

% % Approximating histogram curve to get the simulated PDF curve % 
approxPDF = c/(step*sum(c)); % Simulated PDF from the x and y samples % 
range1 = range(1:30);

% % Plotting Theoretical PDF of the Rayleigh fading channel% 
fr = (range./0.5).*exp((-range.^2)); 

plot(range1,approxPDF,'r*');
hold on
plot(range,fr,'b');

title('Theoretical and Simulated Rayleigh PDF for variance = 0.5'); 
legend('Simulated PDF', 'Theoretical PDF');
xlabel('R')
ylabel('Probability of R, P(R)');

grid on;