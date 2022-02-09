% Set clear & Initialization
clear variables; close all; clc;

N = 10^6; % Bit samples to transmit
EbN0dB = -6:2:10;

databits = randi([0 1],1,N); 
bpskModulated = 2*databits-1; % categorize modulated signal on constellation diagram

BER = zeros(1,length(EbN0dB));

j = 1;
for k = EbN0dB
EbN0 = 10.^(EbN0dB/10); 
h = 1 /sqrt(2)*(randn(1,N)+1i*randn(1,N)); % Rayleigh Flat Fading factor- single tap

noise = sqrt(1/(2))*(randn(1,N)+1i*randn(1,N)); % AWGN noise
n = noise*10^(-EbN0dB(j)/20); %Scaling the noise for required Eb/N0

received = h.*bpskModulated + n; %received signal through Rayleigh channel

%Coherent Receiver for Rayleigh fading Channel
equalization = received./h; %Assuming that h is known at the receiver

estimated_rayleigh = real(equalization) >0;

BER(j) = sum(xor(databits,estimated_rayleigh));

j = j+1;
end

BER = BER/N;

% Theoretical BER v SNR for BPSK.......................................

Pe = 0.5*(1-sqrt(EbN0./(1+EbN0)));

semilogy(EbN0dB,BER,'r--','LineWidth',1.5);
hold on;

plot(EbN0dB,Pe,'k*','LineWidth',1.5); 
axis([-5 10 10^-3 2]);

legend('Simulated Rayleigh','Theoretical Rayleigh');
title('BER vs SNR for BPSK Modulation over Rayleigh fading channel');
xlabel('Eb/N0(dB)');
ylabel('Probability of error, Pe');
grid on;