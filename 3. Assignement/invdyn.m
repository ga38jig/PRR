function [ Tao ] = invdyn( Q, dQ, ddQ)
%INVDYN Simulates the inveres dynamics of the robot.
%   Detailed explanation goes here

% Declare dynamical parameters.
L = 1;
p = 7806;
w = 0.05;
m = p * w^2 * L;
g = 9.81;

% Initialize Arrays:
Tao = zeros(2, length(Q));

% Compute Dynamical Matrices.
for i=1:length(Q)
    
    q1 = Q(1,i);
    q2 = Q(2,i);
    dq1 = dQ(1,i);
    dq2 = dQ(2,i);
    ddq1 = ddQ(1,i);
    ddq2 = ddQ(2,i);

    % Inertial Matrix:
    M = m*L^2 * [5/3+cos(q2) 1/3+1/2*cos(q2);
                1/3+1/2*cos(q2) 1/3];
    
    % Centrifugal Forces Matrix:
    N = m*L^2 * [-sin(q2*dq1*dq2)-1/2*sin(q2*dq2^2);
                1/2*sin(q2*dq1^2)];
            
    % Gravitational Forces:
    G = m*g*L * [3/2*cos(q1)+1/2*cos(q1+q2);
                1/2*cos(q1+q2)];
            
    % Compute Control Forces.
    Tao(:,i) = M * [ddq1 ddq2]' + N + G;

            
end


end



