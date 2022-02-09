% Set clear & Initialization
clear variables; close all; clc;

EbN0dB = -6:2:20; 
EbN0 = 10.^(EbN0dB/10);

theoretical_rayleigh = 0.5*(1-sqrt(EbN0./(1+EbN0)));
theoretical_awgn = 0.5*erfc(sqrt(EbN0));
theoretical_noncoherent = 1/2*(1 + EbN0);

semilogy(EbN0dB,theoretical_rayleigh,'k--','LineWidth',1.5); hold on
semilogy(EbN0dB,theoretical_awgn,'b','LineWidth',1.5); hold on;
semilogy(EbN0dB,theoretical_noncoherent,'r--','LineWidth',1.5);grid on;
axis([-6 25 10^-20 10^10]);

legend('Coherent BPSK','BPSK over AWGN', 'Noncoherent Orthogonal','location','southwest');
title('Eb/N0 Vs BER for BPSK over Rayleigh and AWGN Channels');
xlabel('Eb/N0(dB)');
ylabel('Bit Error Probability, Pe');