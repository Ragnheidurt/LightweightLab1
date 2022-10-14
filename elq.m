function [Qe]=elq(le,q,qt);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Assemble element load vector
% File name: elq.m
% 
% le [m]	Element length
% q  [N/m]	Element distributed load (constant in the lab)
% qt  [N]	Element distributed torque (constant in the lab)
% Qe is returned - element load vector
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


Qe = [6*(q*le)/(12); -le*(q*le)/12; (qt*le)/2; 6*(q*le)/(12); le*(q*le)/12; (qt*le)/2];


