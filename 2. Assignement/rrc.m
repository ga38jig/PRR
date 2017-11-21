function [ Q, dQ, W, K, Tao] = rrc(q0, dw0, F0, T)
%RRC Summary of this function goes here
%   Detailed explanation goes here

% q0: Initial joint angles
% dw0: constant cartesian velocity
% F0: constant external force
% T: simulation time

% Q: joint angles
% dQ: angular velocity of joints
% W: position of end effector
% K: determinant of Jacobian matrix
% Tao: joint torques

d_t=0.1;

for t=0:d_t:T
    
    if t==0
        Q(t)=q0;
    enddet matlab0
    

end

