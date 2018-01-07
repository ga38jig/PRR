function [ Rob ] = createRobot()
%CREATEROBOT Creates a SerialLink object of the robot.
%   Detailed explanation goes here

% Declare dynamical parameters:
L1 = 4; 
L2 = 3; 
L3 = 2;
m1 = 20; 
m2 = 15; 
m3 = 10;
r1 = [-L1/2, 0, 0]';
r2 = [-L2/2, 0, 0]';
r3 = [-L3/2, 0, 0]';
I1 = diag([0,0,0.5]);
I2 = diag([0,0,0.2]);
I3 = diag([0,0,0.1]);
Jm = 0;
G = 1;

% Describe Robot:
L_dyn(1) = Link('d', 0, 'a', L1, 'alpha', 0, 'm', m1, 'r', r1, 'I', I1, 'Jm', Jm, 'G', G );
L_dyn(2) = Link('d', 0, 'a', L2, 'alpha', 0, 'm', m2, 'r', r2, 'I', I2, 'Jm', Jm, 'G', G );
L_dyn(3) = Link('d', 0, 'a', L3, 'alpha', 0, 'm', m3, 'r', r3, 'I', I3, 'Jm', Jm, 'G', G );
Rob = SerialLink(L_dyn, 'name', 'planar_robot_dyn');

Rob.gravity = [0, 9.81, 0]';


end

