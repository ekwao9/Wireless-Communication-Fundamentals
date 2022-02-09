% Set clear & Initialization
clear variables; close all; clc;

% Simulated BER v SNR for BPSk.....................................
N = 10^6; % Bit samples to transmit
EbN0dB = -6:2:10; % Eb/N0 range in dB for simulation

databits = randi([0 1],1,N);
bpskModulated = 2*databits-1; % categorize modulated signal on constellation diagram

BER= zeros(1,length(EbN0dB)); % A container for BER values for all Eb/N0

i = 1; 
for k = EbN0dB
EbN0 = 10.^(k/10); 

noise = sqrt(1./(2*EbN0))*randn(1,N);
received_signal = bpskModulated + noise;

% Detecting what bit of signal is received
estimated_bits = received_signal >= 0;

% BER due to estimated bits
BER(i)= sum(xor(databits,estimated_bits)); % using XOR as comparator

i = i+1;
end
BER = BER/N;


semilogy(EbN0dB,BER,'r--','LineWidth',1.5);
title('BER vs SNR for BPSK Modulation in AWGN');
xlabel('Eb/N0 in dB');
ylabel('Bit Error Rate (BER) in dB');
hold on;

% Theoretical BER v SNR for BPSK.......................................
Pe = 0.5*erfc(sqrt(10.^(EbN0dB/10)));
semilogy(EbN0dB,Pe,'k*','LineWidth',1.5);
legend('Simulated','Theoretical');
grid on;
