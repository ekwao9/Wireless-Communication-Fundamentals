% Set clear & Initialization
clear variables; close all; clc;

N = 1000000;
x = randn(N,1);
y = randn(N,1);

R = sqrt(0.8*(x.^2 + y.^2));
range = 0:0.1:3;

h = histogram(R,range,"Normalization","pdf"); % creates a histogram that is normally distributed

hold on 
Rice_distribution = fitdist(R,'Rician');
Rp =  pdf(Rice_distribution,range);

plot(range,Rp,'r');

legend('Simulated PDF','Theoretical PDF');
title('Simulated and Theoretical PDFs of Rice Distribution');
ylabel('Probability of R, P(R)');
xlabel('R')