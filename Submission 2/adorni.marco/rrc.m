function [ Q, dQ, W, K, Tao] = rrc(q0, dw0, F0, T)
%RRC Summary of this function goes here
%   Detailed explanation goes here

% q0: Initial joint angles = [t1_0; t2_0; t3_0]
% dw0: constant cartesian velocity = [rx'; ry'; phi']
% F0: constant external force = [fx; fy; fz]
% T: simulation time 

% Q: joint angles
% dQ: angular velocity of joints
% W: position of end effector
% K: determinant of Jacobian matrix
% Tao: joint torques

% Robot description
L(1) = Link('d', 0, 'a', 4, 'alpha', 0);
L(2) = Link('d', 0, 'a', 3, 'alpha', 0);
L(3) = Link('d', 0, 'a', 2, 'alpha', 0);

R = SerialLink(L, 'name', 'planar_robot');

% Time steps:
dt=0.1;

% Array Index:
i=1;

% Arrays:
Q=zeros(3,T/dt);
dQ=zeros(3,T/dt);
W=zeros(3,T/dt);
K=zeros(1,T/dt);
Tao=zeros(3,T/dt);

% Main loop: goes through timesteps.
for t=0:dt:T
    
    % Phase 0.
    if i==1
        Q_ = q0;    
    else
        % Explicit Euler Method as Numerical Integration Scheme.
        Q_ = Q(:,i-1) + dQ_ * dt;
    end
       
    % Main Computational Body.
    J0_ = R.jacob0(Q_,'rpy');
    J0 = J0_([1;2;6],:);
    dQ_ = J0\dw0; 
    oTe = R.fkine(Q_);
    W_ = [oTe(1,4); oTe(2,4); sum(Q_)];
    K_ = det(J0);
    Tao_ = J0'*F0;
    
    % Updating Arrays.
    Q(:,i)=Q_;
    dQ(:,i) = dQ_;
    W(:,i) = W_;
    K(:,i) = K_;
    Tao(:,i) = Tao_;
    
    % Update Index.
    i=i+1;
    
end
    



