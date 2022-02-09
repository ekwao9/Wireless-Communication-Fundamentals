% Set clear & Initialization
clear variables; close all; clc;

N = 1000000;
x = randn(N,1);
y = randn(N,1);

R = sqrt(0.8*(x.^2 + y.^2)); % Rice fading envelope
range = 0:0.1:3;

h = histogram(R,range,"Normalization","cdf"); % estimating normal cdf curve of the histogram
hold on 

Rice_distribution = fitdist(R,'Rician');
Rc =  cdf(Rice_distribution,range);

 
plot(range,Rc,'r')

hold on

legend('Simulated CDF','Theoretical CDF','Location','northwest');
title('Simulated and Theoretical CDF of Rician Distribution');