function [Q, dQ, ddQ, t, Tao] = fwddyn(Rob, q0, dt, T)
%FWDDYN Summary of this function goes here
%   Detailed explanation goes here


% Time vector:
t = 0:dt:T;

% Initialize Arrays:
Tao = zeros(3,length(t));
Q = zeros(3,length(t));
dQ = zeros(3,length(t));
ddQ = zeros(3,length(t));

% Index:
i = 1;

% Main Loop:
for t_=0:dt:T
    
    if i == 1
        
        % Initial Condition:
        Q(:,1) = q0;
        dQ(:,1) = [0 0 0]';
        Tao(:,1) = [0 0 0]';
        ddQ(:,1) = Rob.accel(Q(:,1)', dQ(:,1)', Tao(:,1)');
        
    else
        
        % Integration Scheme for Joint Velocity:
        dQ(:,i) = dQ(:,i-1) + ddQ(:,i-1)*dt;
        
        % Integration Scheme for Joint Position:
        Q(:,i) = Q(:,i-1) + dQ(:,i-1)*dt + ddQ(:,i-1)*dt^2/2;
        
        % Compute Joint Torque:
        Tao(:,i) = Rob.gravload(Q(:,i)');
    
        % Compute Joint AAcceleration:
        ddQ(:,i) = Rob.accel(Q(:,i)', dQ(:,i)', Tao(:,i)');
        
    end

    % Update Index:
    i = i + 1;

end

