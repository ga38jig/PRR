function [ q ] = rwl( w, q0)
%RWL Summary of this function goes here
%   Detailed explanation goes here

% Define Robot.
L(1) = Link('d', 0, 'a', 4, 'alpha', 0);
L(2) = Link('d', 0, 'a', 3, 'alpha', 0);
L(3) = Link('d', 0, 'a', 2, 'alpha', 0);
R = SerialLink(L, 'name', 'planar_robot');

% Initialiye Array.
q = zeros(3,21);

% Initialize Index.
i=1;

% Initialize q0.
q(:,1)=q0;

% Start Iterating.
while( i<=21 )
    
    % Compute required elemnts for the iteration.
    J0_ = R.jacob0(q(:,i),'rpy');
    J0 = J0_([1;2;6],:);
    T = R.fkine(q(:,i));
    f = [T(1,4) T(2,4) q(1,i)+q(2,i)+q(3,i)]';
    
    % Newton-Raphson Step.    
    q(:,i+1) = q(:,i) - inv(J0) * ( f - w );
    
    % Break loop if the delta of the angles is less than 0.01.
%     if q(1,i+1)-q(1,i)<0.01 && q(2,i+1)-q(2,i)<0.01 && q(3,i+1)-q(3,i)<0.01
    if norm( q(:,i+1) - q(:,i) ) < 0.01
        
        break
        
    else
    
        i = i+1;    
        
    end
    
end

end

