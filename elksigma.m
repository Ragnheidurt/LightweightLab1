function [Kesigma]=elksigma(le,P,I0,A);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Assemble element initial stress stiffness matrix
% File name: elksigma.m
% 
% le [m]	Element length
% P  [N]	"Tensile" buckling load
% I0		element polar moment of inertia [m4]
% A		element cross-section area [m2]
% Kesigma is returned - element initial stress matrix
%
% Make sure the initial stress matrix is symmetric!
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Kesigma = P/(30*le)*[36 -3*le 0 -36 -3*le 0;
    -3*le 4*le^2 0 3*le -le^2 0;
    0 0 (30*I0)/A 0 0 -(30*I0)/A;
    -36 3*le 0 36 3*le 0;
    -3*le -le^2 0 3*le 4*le^2 0;
    0 0 -(30*I0)/A 0 0 (30*I0)/A];

