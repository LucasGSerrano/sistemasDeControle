%%% Rotina para configurar simulador

%% Par�metros do motor

Km = pi;
Ktac = 0.75/pi;
Kenc = 2.4605;
taum = 0.5015;

%% Entrada

M=length(in);

tempo=linspace(0,(M-1)*0.01,M)';

input=[tempo,in];

%% velocidade

velt=[tempo,vel];

%% posi��o

post=[tempo,pos];

