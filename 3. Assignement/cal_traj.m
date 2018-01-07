function [ Traj ] = cal_traj(via, q0, tao, tBe, dt)
%CAL_TRAJ  Computes a path for an arbitary number n of via points with 
% dimension n consitsting of linear segments with quadratic blends and 
% starting at point q0.
%   Algorithmm considers 3 points at a time:
%   First Iteration: Starting point q0, first via point and second viapoint
%                       and computes the first acceleration phase and the
%                       first constant velocity phase.
%   Second Iteration: The first point of the acceleration phase is the last
%                       of the constant velocity phase of the previous
%                       iteration. The second point is the second viapoint,
%                       or the C of the previous iteration. The third point
%                       is the third viapoint.
% Third and Final Iteration: This is the last iteration and only contains 
%                       an
%                       acceleration Phase. The first point is the last
%                       point of the constant velocity phase of the 
%                       previous iteration.
%                       The second point is the Stop point, which also is
%                       the C of the previous iteration and the last
%                       viapoint. The third point is again the same point,
%                       so to reach the point with velocity dq=0 after the
%                       acceleration phase.

% % Iteration Scheme for 3 Via Points
% % First Iteration:
% A1 = q0;
% B1 = via(:,1);
% C1 = via(:,2);
% dC1 = C1 - B1;
% dB1 = B1 - A1;
% 
% % Second Iteration:
% A2 = C1_;
% B2 = C1;
% C2 = via(:,3);
% 
% % Third and Final Iteration:
% A3 = C2_;
% B3 = C2;
% C3 = C2;
% 
% % Total Time spent for 3 Iterations:
% % T = total time of first iterations + total time of second iteration +
% % acceleration time of third iteration.
% T = tao + tao + 2*tBe;
% T = (n-1)*tao + 2*tBe;


% Actual Algorithm

% Number of Via Points:
n = length(via);

% Initialize Index:
i=1;

% Initial Condition:
A = q0;
B = via(:,1);
C = via(:,2);
dC = C - B;
dB = B - A;

% Initialize Trajectory:
k = 1;
Traj(:,k) = A;

% While Loop: Cycle Repeats for every Viapoint:
while i<=n
    
    % Initialize Iteration Parameters:
    if i>1
        
        A = C_;
        B = C;
        C = via(:,i+1);
        dC = C - B;
        dB = B - A;
        
    end
    
    % Main Loop:
    for t=-tBe:dt:tao-tBe

        % Acceleration Phase:
        if t>-tBe && t <= tBe
            
            % Relative Time:
            h1 = (tBe+t_)/(2*tBe);            
            
            % Compute Trajectory: 
            Traj(:,k) = ((dC*tBe/tao-dB)*h1 + 2*dB)*h1 + A;
           
        end

        % Constant Velocity Phase: 
        if t>tBe && t<=tao-tBe
           
            % Relative Time:
            h2 = t_/tao;
        
            % Trajectory
            Traj(:,k) = dC*h2 + B;
            
            % Save Last Point:
            if t == tao-tBe
                C_ = Traj(:,k);                
            end
            
        end
        
        % Update k:
        k = k+1;
    end

    % Update Iteration Index:
    i = i+1;

end

end
