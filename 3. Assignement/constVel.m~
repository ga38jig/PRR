function [Q, dQ, ddQ, W, t] = constVel(q0, dw0, delta_t, T)
%CONSTVEL Summary of this function goes here
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

% Define Robot Description.
L(1) = Link('d', 0, 'a', 1, 'alpha', 0);
L(2) = Link('d', 0, 'a', 1, 'alpha', 0);
R = SerialLink(L, 'name', 'planar_robot');

% Initialize Index.
i=1;


for t=0:delta_t:T
    
    if i ~=1
        
        % Finite Difference Scheme to Compute Accelerations:
        ddQ(:,i-1) = ( dQ(:,i) - dQ(:,i-1) ) / delta_t;
    
    end
    
    

    i=i+1;
end



end


% Define function to compute joint velocities.
function dQ_ = func(R, dw0, Q)
    
    J0_ = R.jacob0(Q');
    J0 = J0 = J0_([1;2;6],:);

end
    

