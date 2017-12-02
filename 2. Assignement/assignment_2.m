%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Exercise 1: Jacobian Matrix %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% a) Compute the Jacobian matrix from the forward kinematics.
L1=4; L2=3; L3=2;

syms t1 t2 t3
syms J(t1, t2, t3)

J(t1, t2, t3)=[L1*-sin(t1)+L2*-sin(t1+t2)+L3*-sin(t1+t2+t3), L2*-sin(t1+t2)+L3*-sin(t1+t2+t3), L3*-sin(t1+t2+t3);...
    L1*cos(t1)+L2*cos(t1+t2)+L3*cos(t1+t2+t3), L2*cos(t1+t2)+L3*cos(t1+t2+t3), L3*cos(t1+t2+t3);...
    1, 1, 1];

eqn = det(J) == 0;
s = solve(eqn,[t1 t2 t3])

s.t1
s.t2
s.t3

%% b) Implement cal_J().

J = cal_J(pi,pi/2,pi/3)

%% TEST: Test a) and b) with jacob0()
L(1) = Link('d', 0, 'a', 4, 'alpha', 0);
L(2) = Link('d', 0, 'a', 3, 'alpha', 0);
L(3) = Link('d', 0, 'a', 2, 'alpha', 0);

R = SerialLink(L, 'name', 'planar_robot');

J0 = R.jacob0([pi, pi/2, pi/3],'rpy')

%% c) Implement rrc() to simulate the movement of the robot using the Resolved Rate Control.

q0 = degtorad([10 20 30]');
dw0 = [0.2 -0.3 -0.2]';
F0 = [1 2 3]';
T = 5;

[ Q, dQ, W, K, Tao] = rrc(q0, dw0, F0, T);




