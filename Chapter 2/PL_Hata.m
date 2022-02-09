function PL = PL_Hata(fc,d,htx,hrx,Etype) 

% Inputs: fc : Carrier frequency[Hz]
% d : Distance between base station and mobile station[m]
% htx : Height of transmitter[m]
% hrx : Height of receiver[m]
% Etype : Environment type(’urban’,’suburban’,’open’)
% Output: PL : path loss[dB]

if nargin<5
    Etype = 'URBAN';
end
fc = fc/(1e6);

if fc >= 150 && fc <= 200
    C_Rx = 8.29*(log10(1.54*hrx))^2 - 1.1;
elseif fc > 200
    C_Rx = 3.2*(log10(11.75*hrx))^2 - 4.97; % Eq.(1.9)
else 
    C_Rx = 0.8+(1.1*log10(fc)-0.7)*hrx-1.56*log10(fc); % Eq.(1.8)
end

PL = 69.55 +26.16*log10(fc) -13.82*log10(htx) -C_Rx + (44.9-6.55*log10(htx))*log10(d/1000); % Eq.(1.7)
EType = upper(Etype);

if EType(1) == 'S'
    PL = PL -2*(log10(fc/28))^2 -5.4; % Eq.(1.10)
elseif EType(1) == 'O'
PL=PL+(18.33-4.78*log10(fc))*log10(fc)-40.97; % Eq.(1.11)
end