%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Exercise 1: Inverse Dynamics %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% a) Implement constVel to compute joint angles, velocities and accelerations.
q0 = degtorad([45 90]');
dw0 = [0 0.5]';
delta_t = 0.01;
T = 1;
[Q, dQ, ddQ, W, t] = constVel(q0, dw0, delta_t, T);