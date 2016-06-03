clear;
 load('data');
%% 

kc = 0.2371;
pc = 0.1;
zc = 0.25;

Ktac = 0.25;
taum = 0.5015;
Kenc = 3.18;
Km = pi;

%% 

tempo = linspace(0, max(size(pos))*0.01, max(size(pos)))';
 
vel = [tempo vel];
 
pos = [tempo pos];
 
in = [tempo in];

%% 

tempo = linspace(0, max(size(vel))*0.01, max(size(vel)))';

pos=pos(2:end,:);

vel=vel(2:end,:);

in=in(2:end,:);

%% 

% Gma = tf(Km*Kenc,[taum 1 0]);

Gma = tf(Km*Ktac,[taum 1]);

Gmf = feedback(Gma,1);

step(Gmf);

Ts = 0.8*0.179;

% sisotool(Gma)
