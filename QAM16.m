% IFSC - Instituto Federal de Santa Catarina
% Aluno: Rafael Teles Espindola
% Disciplina: Sistemas de comunicação 1
% Professor : Mário de Noronha Neto
%
%
%              16-QAM              Função qammod([0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15], 16)
%
%                 Q
%          x   x  |  x   x         0   4  |  8  12       Q  
%                 |                       |              u   
%          x   x  |  x   x         1   5  |  9  13       a 
%         ----------------- I     -----------------      d
%          x   x  |  x   x         2   6  |  10 14       r 
%                 |                       |          F   a   s   e
%          x   x  |  x   x         3   7  |  11 15       t
%                                                        u
%                                                        r
%                                                        a
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all; close all; clc;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fc       = 10e3;                                    % Frequencia da portadora
M        = 16;                                      % Número de simbolos 
N        = 30;                                      % Fator de super amostragem
info     = randi([0 15], 1, 100);                   % Infomação original
info_mod = qammod(info, M);                         % Gera as coordenadas da constelação

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
passo    = ((2*length(info))/fc)/(length(info)*N);
t        = 0:passo:((2*length(info))/fc)-passo;

scatterplot(info_mod)                               % Imagem da constelação

info_I   = real(info_mod);                          % Parte real
info_Q   = imag(info_mod);                          % Parte imaginária

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
info_I_format = rectpulse(info_I, N);
info_Q_format = rectpulse(info_Q, N);

figure(2)
    subplot(211)
        plot(info_I_format)
    subplot(212)
        plot(info_Q_format)
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
info_I_tx = info_I_format.*cos(2*pi*fc*t);        
info_Q_tx = info_Q_format.*sin(2*pi*fc*t);
 
figure(3)
    subplot(211)
        plot(t, info_I_tx)
    subplot(212)
        plot(t, info_Q_tx)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
info_tx = info_I_tx + info_Q_tx;

figure(4)
    plot(t, info_tx)






