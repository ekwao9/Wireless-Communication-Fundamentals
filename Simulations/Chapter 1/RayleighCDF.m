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

h = histogram(R,range,'Normal','cdf');
c = h.Values;

% % Approximating histogram curve to get the simulated CDF curve % 
approxCDF = 2.128*(c/(step*sum(c))); % Simulated CDF from the x and y samples % 
range1 = range(1:30);


% % Plotting Theoretical CDF of the Rayleigh fading channel% 
Fr = 1-exp(-range.^2); % the Rayleigh CDF; 

plot((range1), (approxCDF),'r*');
hold on
plot((range), (Fr),'b');


title('Theoretical and Simulated Rayleigh CDF for variance = 0.5'); 
legend('Simulated CDF', 'Theoretical CDF','location','southeast');
xlabel('R')
ylabel('Probability of R, P(R)');

grid on;