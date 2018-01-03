function [Q, dQ, ddQ, W, t] = constVel(q0, dw0, dt, T)
%CONSTVEL Computes joint angles, velocities and accelerations that result
%from a motion with constant velocity dw0.
%   Detailed explanation goes here

% INPUTS:
% q0: Initial Joint Angles.
% dw0: Constant Cartesian Velocity.
% delta_t: Simulation Time Step.
% T: Overall Simulation Time.

% OUTPUTS:
% Q: Joint Angles.
% dQ: Joint Velocities.
% ddQ: Joint Accelerations.
% W: Cartesian Position of the End Effector.
% t: Time Steps of the Simulation.

% Describe Robot.
L(1) = Link('d', 0, 'a', 1, 'alpha', 0);
L(2) = Link('d', 0, 'a', 1, 'alpha', 0);
R = SerialLink(L, 'name', 'planar_robot');

% Initialize Index.
i=1;

% Initialize Arrays.
dQ = zeros(2,T/dt+1);
ddQ = zeros(2,T/dt+1);
W = zeros(2,T/dt+1);

% Compute Joint Angles with ode45 Integration.
t=0:dt:T+dt;
FUNC = @(t,q)func(R, dw0, q);
[t,Q] = ode45(FUNC,t,q0);
Q = Q';

for t_=0:dt:T+dt
    
    % Compute Joint Velocity.
    dQ(:,i) = func(R, dw0, Q(:,i));
    
    % Compute Joint Position:
    oTe = R.fkine(Q(:,i));
    W(:,i) = [oTe(1,4) oTe(2,4)]';
    
    if i~=1
        
        % Finite Difference Scheme to Compute Accelerations:
        ddQ(:,i-1) = ( dQ(:,i) - dQ(:,i-1) ) / dt;
    
    end
    
    i=i+1;
    
end

% Reformat Outputs.
t = 0:dt:T;
Q = Q(:,1:101);
dQ = dQ(:,1:101);
W = W(:,1:101);

end


% Define function to compute joint velocities.
function dq_ = func(R, dw0, q)
    
    J0_ = R.jacob0(q');
    J0 = J0_([1;2],:);
    dq_ = J0\dw0; 

end

    

