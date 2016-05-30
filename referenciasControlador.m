clear;
% load('data');

kc = 0.2371;
pc = 0.1;
zc = 0.25;

Ktac = 0.25;
taum = 0.5015;
Kenc = 3.18;
Km = pi;

% tempo = linspace(0, max(size(pos))*0.01, max(size(pos)))';
% 
% vel = [tempo vel];
% 
% pos = [tempo pos];
% 
% in = [tempo in];

Gma = tf(Km*Kenc,[taum 1 0]);

Gmf = feedback(Gma,1);

step(Gmf);

Ts = 0.8*3.59;

% sisotool(Gma)

tempo = linspace(0, max(size(vel))*0.01, max(size(vel)))';

pos=pos(2:end,:);

vel=vel(2:end,:);

in=in(2:end,:);

vel = [tempo vel];

pos = [tempo pos];
 
in = [tempo in];