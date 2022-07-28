clear all;
clc;

T = 1.6;                      
ND = 1000; % Number of OFDM symbols
nn = 0:ND; % OFDM symbols range from 0 to 1000
ts = 0.002; % Symbol period
tt = nn*ts; % Time interval
Ts = 0.1; 
M = round(Ts/ts); % Sampling period in continuous/discrete-time
nns = [1:M:ND+1]; 
tts = (nns-1)*ts; % Sampling indices and times
ks = [1:4 3.9 4];                      % subc
tds = [0 0 0.1 0.1 0 0.15]; % Frequencies and delays
K = length(ks);

for i = 1:K
    k = ks(i); 
    td = tds(i);
    x(i,:) = exp(1i*2*pi*k*(tt-td)/T);
    
    if i == K
        x(K,:) = [x(K,[302:end]) x(K-3,[1:301])];
    end
    
    subplot(K,2,2*i-1)
    plot(tt,real(x(i,:)))
    
    hold on
    plot(tt([1 end]),[0 0],'k')
    stem(tts,real(x(i,nns)),'.')

end

N = round(T/Ts); 
xn = x(:,nns(1:N));
xn*xn'/N; % check orthogonality
Xk = fft(xn.').'; kk = 0:N-1;

for i = 1:K
    k = ks(i); 
    td = tds(i); 
    subplot(K,2,2*i)
    stem(kk,abs(Xk(i,:)), '.' );
end