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

display(J)

% eqn = det(J) == 0;
% s = solve(eqn,[t1 t2 t3])
% 
% s.t1
% s.t2
% s.t3

%% b) Implement cal_J().

J = cal_J(pi,pi/2,pi/3);

display(J);

%% TEST: Test a) and b) with jacob0()
L(1) = Link('d', 0, 'a', 4, 'alpha', 0);
L(2) = Link('d', 0, 'a', 3, 'alpha', 0);
L(3) = Link('d', 0, 'a', 2, 'alpha', 0);

R = SerialLink(L, 'name', 'planar_robot');

J0 = R.jacob0([pi, pi/2, pi/3],'rpy');

display(J0)

%% c) Implement rrc() to simulate the movement of the robot using the Resolved Rate Control.

q0 = degtorad([10 20 30]');
dw0 = [0.2 -0.3 -0.2]';
F0 = [1 2 3]';
T = 5;

[ Q, dQ, W, K, Tao] = rrc(q0, dw0, F0, T);

display(Q)
display(dQ)
display(W)
display(K)
display(Tao)
 
% planar_robot.teach([pi/2,-pi/4, -pi/3])

%% TEST: Use forward kinematics to check joint angles at T = 5s.

Q_initial = Q(:,1);
T = R.fkine(Q_initial');
w_initial = [T(1,4); T(2,4); Q_initial(1)+Q_initial(2)+Q_initial(3)];
Time = 5;
w_final = w_initial + Time * dw0;
w_calc = W(:,51);


display(w_final)
display(w_calc)

%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Exercise 1: Inverse Kinematics %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% a) Consider how the inverse kinematics that compute q from w could be derived.

%% b) Implement Newton-Raphston to iteratively compute the inverse kinematics.
q0 = [0.1 0.2 0.3]';
theta1 = degtorad(10);
theta2 = degtorad(20);
theta3 = degtorad(30);


% oTe1 = [0.5,-0.866,0,6.3925;
%         0.866,0.5,0,6.0302;
%         0,0,1,0;
%         0,0,0,1];
    
oTe2 = [0.5,-0.866,0,7.5373;
        0.866,0.5,0,3.9266;
        0,0,1,0;
        0,0,0,1];
    
% w1 = [oTe1(1,4) oTe1(2,4) q0(1)+q0(2)+q0(3)]';
w = [oTe2(1,4) oTe2(2,4) theta1+theta2+theta3]';
    
q = rwl(w,q0);

display(q)


% M = [1 1 1 0 0 0];
%

% q2 = rwl(w2,q0)













