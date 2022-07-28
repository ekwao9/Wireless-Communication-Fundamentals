clear all;
clc;

out_prob = 0.01; % Outage probability
beta_dB = 6; % energy bit per interference noise per chip for IS-95
max_spec_eff = 1/10.^(beta_dB/10); % Maximum Spectral Efficiency Achieved for very large number of users
p = 3/8; % probability that each user is active and has data to send
k = 20:20:200; % Number of users
Q = (1/2)*erfc(out_prob/sqrt(2));
Q_inv = Q^-1;

for  users = k

rho = max_spec_eff*(1 + Q_inv*sqrt((1 - p)./(k*p)) - 1./(k*p)).^-1;

end 

cla
axis([20 200 0 0.26])
hold on

line(xlim,[max_spec_eff max_spec_eff],'LineStyle','--','Color','r')

plot(k, rho);

ylabel('Spectral Efficiency, rho')
xlabel('Number of users, K')
legend('Maximum Efficiency','Spectral Efficiency','Location','southeast')
title('Spectral Efiiciency as a function of number of users in a system with burstiness')
grid on
