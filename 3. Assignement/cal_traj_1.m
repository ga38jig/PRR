function [ Traj ] = cal_traj_1(via, q0, tao, tBe, dt)
%CAL_TRAJ Computes a path for an arbitary number n of via points with 
% dimension n consitsting of linear segments with quadratic blends and 
% starting at point q0.
%   Detailed explanation goes here

% INPUTS:
% via: serie of via points (mxn)
% q0: starting point
% tao: length of the linear segment
% tBe: acceleration time
% dt: sample time

% OUTPUT:
% Traj: computed path (mxk)

% Number of Via Points:
n = length(via);

% Total Simulation Time:
T = 2*tBe + (n-2)*tao;

% Simulation Steps:
K = T / dt + 1;

% Initialize Arrays:
Traj = zeros(2, K);

% Start Point:
START = q0;

% Stop Point:
STOP = via(:,n);


% Initial Accelaration Phase:
% Declare Required Parameters:
A = START;
B = via(:,1);
C = via(:,2);
dC = C - B;
dB = B - A;

% Index
k=1;

for t=0:dt:2*tBe-dt
    
    % Adapt Time
    t_ = t-tBe;
    
    % Relative Time
    h1 = (tBe+t_)/(2*tBe);
    
    % Trajectory
    Traj(:,k) = ((dC*tBe/tao-dB)*h1 + 2*dB)*h1 + A;
    
    % Update Index.
    k = k + 1;
    
end

% Main Loop

% Loop Index:
i=0;

for t=2*tBe:dt:T
    
    % Declare Required Parameters
    if i ~= 0
        
        A = A_;
        B = via(:,i+1);
        C = via(:,i+2);
        
        dB = B - A;
        dC = C - B;
        
    end
    
    % Constant Velocity Phase:
    if t >= 2*tBe + (tao*i) && t <= tao*(i+1)
        
        % Adapt Time:
        t_ = t - tBe - tao*i;
        
        % Relative Time
        h2 = t_/tao;
        
        % Trajectory
        Traj(:,k) = dC*h2 + B;
        
        % Save A_ for later use
        if t == tao*(i+1)
            A_ = Traj(:,k);
        end
    
    % Acceleration Phase:
    elseif t > tao*(i+1) && t <= 2*tBe - tao*i
        
        A = A_
        
        
        
    end
    
end        

end







