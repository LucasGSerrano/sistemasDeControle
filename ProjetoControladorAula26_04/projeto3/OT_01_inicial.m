%******************** PI otimo  ****************************
%*
%* Título:				Otimizaçao para identificaçao
%* Versão:				1.00
%* Data Atualização:	outubro 2008
%* Objetivo:			funcaçao base de otimizacao
%* Autoria:				VCP
%*
%* Description: 
%* 
%* Matlab function: 
%*
%*
%*
%**************************************************************
% Inicializa.M

clear;

clc;

global k a b

T=0.2;

beta=1;

alfa=1;

po=[1 1 1];

options = foptions([1 1e-2 1e-2 1e-2]);

fminsearch('OT_01_merito', po ,options);



