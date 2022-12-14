function [defl,teta,fi,umax,tmax,fimax]=bending(Ks,Qs,K,Q,nnode,node_z);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calculate deformed beam bending and torsion shape and plot results
% File name: bending.m
%
% Ks		Structural stiffness matrix
% Qs		Structural load vector
% K		System stiffness matrix 
% Q		System load vector
% nnode		Number of nodes
% node_z	Nodal z-coordinates
%
% defl		Deflection vector of size nnodes
% teta		Rotation vector of size nnodes
% fi		Twist vector of size nnodes
% umax		Maximum deflection
% tetamax	Maximum rotation
% fimax		Maximum twist
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Solve system of equations
ws = Ks\Qs;
w = zeros(3*nnode,1);
w(4:3*nnode) = ws;

% Present displacements at the free end
disp('Displacement at the free end is:')
disp(w(length(w)-2:length(w)))


% Present reaction forces
Fr = K*w-Q;
disp('Reaction forces are')
disp(Fr(1:2))

% Create result vector containing deflections, rotations and twist

% Split deflections, rotations and twist into separate vectors
defl = zeros(nnode,1);
teta = zeros(nnode,1);
fi = zeros(nnode,1);
count = 1;
for i=1:3:3*nnode
    i
    defl(count) = w(i);
    teta(count) = w(i+1);
    fi(count) = w(i+2);
    count = count +1;
end

umax = 0;
tmax = 0;
fimax = 0;

for i=1:nnode
    if abs(defl(i))> abs(umax)
        umax = defl(i);
    end
    if abs(teta(i)) > abs(tmax)
        tmax = teta(i);
    end
    if abs(fi(i)) > abs(fimax)
        fimax = fi(i);
    end
end
umax
tmax
fimax

% Normalise deflections, rotations and twist and plot results

figure
x = 1:nnode;
plot(x,defl);
hold on
plot(x,teta);
hold on
plot(x,fi);
title('Displacment');
legend('Deflection','rotation','twist');

