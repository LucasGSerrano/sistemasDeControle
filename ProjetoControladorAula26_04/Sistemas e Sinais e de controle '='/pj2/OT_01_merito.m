%******************** PI otimo  ****************************
%*
%* Título:				Otimizaçao para identificaçao
%* Versão:				1.00
%* Data Atualização:	outubro 2008
%* Objetivo:			função base de otimizacao
%* Autoria:				VCP
%*
%* Description: 
%* 
%* Matlab function: 
%*
%*
%*
%**************************************************************
% MERITO_IDENT.M

function J = OT_01_merito(p);

global k a b

k = p(1);
a = p(2);
b = p(3);

if k<=0
    
    k=1e-4;
    
end

if a<=0
    
    a=1e-4;
    
end

if b<=0
    
    a=1e-4;
    
end

options = simset('solver','ode45','MaxStep',0.01,'InitialStep',0.01);

[t,x,y] = sim('OT_01_motor_continuo',50,options);

clc

J = y(max(size(y)))
