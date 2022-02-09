
% Set clear & Initialization
clear variables; close all; clc;

scale = 1e-9; % nano
Ts = 10*scale; % Sampling time
t_rms = 30*scale; % RMS delay spread
num_ch = 10000; % # of channel

% 2-ray model.............................................................
pow_2 = [0.5 0.5]; delay_2 = [0 t_rms*2]/scale;
H_2 = [Ray_model(num_ch); Ray_model(num_ch)].'*diag(sqrt(pow_2));
avg_pow_h_2 = mean(H_2.*conj(H_2));

subplot(221)
stem(delay_2,pow_2,'ko')
hold on
stem(delay_2,avg_pow_h_2,'k.');
xlabel('Delay[ns]'), ylabel('Channel Power[linear]');
title('2-Ray Model');
legend('Ideal','Simulation') 
axis([-10 140 0 0.7]);

% Exponential model.......................................................
pow_e = exp_PDP(t_rms,Ts); delay_e = [0:length(pow_e)-1]*Ts/scale;

for i = 1:length(pow_e)
H_e(:,i) = Ray_model(num_ch).'*sqrt(pow_e(i));
end
avg_pow_h_e = mean(H_e.*conj(H_e));

subplot(222)
stem(delay_e,pow_e,'ko')
hold on
stem(delay_e,avg_pow_h_e,'k.');
xlabel('Delay[ns]')
ylabel('Channel Power[linear]')
title('Exponential Model');
axis([-10 140 0 0.003])
legend('Ideal','Simulation')
