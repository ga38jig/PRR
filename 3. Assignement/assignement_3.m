%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Exercise 1: Inverse Dynamics %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% a) Implement constVel to compute joint angles, velocities and accelerations.
q0 = degtorad([45 90]');
dw0 = [0 0.5]';
dt = 0.01;
T = 1;
[Q, dQ, ddQ, W, t] = constVel(q0, dw0, dt, T);

% Display Outputs.
display(Q)
display(dQ)
display(ddQ)
display(W)

%% TEST: Check outputs of function constVel().
L(1) = Link('d', 0, 'a', 1, 'alpha', 0);
L(2) = Link('d', 0, 'a', 1, 'alpha', 0);
R = SerialLink(L, 'name', 'planar_robot');

% Final cartesian position computed from q_n identical to w_n?
oTe = R.fkine(Q(:,T/dt+1));
w_final = [oTe(1,4) oTe(2,4)]';
w_n = W(:,T/dt+1);
display(w_final)
display(w_n)

%% TEST: Plot position of end effector and joint angular velocities over time.

% Plot cartesian position over time:
subplot(2,2,1)
plot(t, W(1,:))
axis([0 1 -2 2])
title('wx')

subplot(2,2,3)
plot(t, W(2,:))
title('wy')

% Plot joint angular velocities over time:
subplot(2,2,2)
plot(t, dQ(1,:))
title('q1')

subplot(2,2,4)
plot(t, dQ(2,:))
title('q2')

%% TEST: Show Robot animation:
R.plot(Q')

%% b) Implement invdyn() to simulate the inverse dynamics of the robot.

Tao = invdyn(Q,dQ,ddQ);

%% TEST: Compare the result with the function rne().
L = 1;
p = 7806;
w = 0.05;

% Mass:
m = p * w^2 * L;

% COG:
r = [-L/2, 0, 0]';

% Inertia of Links:
Ixx = m/6 * w^2;
Iyy = m/12 * (L^2 + w^2);
Izz = Iyy;
I = diag([Ixx Iyy Izz]);

% Inertia of the Motor:
Jm = 0;

% Gear Ratio:
G = 1;

% Dynamical Robot Description:
L_dyn(1) = Link('d', 0, 'a', L, 'alpha', 0, 'm', m, 'r', r, 'I', I, 'Jm', Jm, 'G', G );
L_dyn(2) = Link('d', 0, 'a', L, 'alpha', 0, 'm', m, 'r', r, 'I', I, 'Jm', Jm, 'G', G );
R_dyn = SerialLink(L_dyn, 'name', 'planar_robot_dyn');

Tao_ = zeros(2,length(Tao));

for i=1:length(Tao_)
    
    Tao_(:,i) = R_dyn.rne(Q(:,i)', dQ(:,i)', ddQ(:,i)', [0 9.81 0]');
    
end

display(Tao)
display(Tao_)

%% TEST: Plot joint torques

% Test fabio
TAU = invdyn_fabio(Q,dQ,ddQ);

% Plot results:
subplot(2,3,1)
plot(t,Tao(1,:))
title('Tao_1')

subplot(2,3,4)
plot(t,Tao(2,:))
title('Tao_2')

subplot(2,3,2)
plot(t,Tao_(1,:))
title('Test_1')

subplot(2,3,5)
plot(t,Tao_(2,:))
title('Test_2')

subplot(2,3,3)
plot(t,TAU(1,:))
title('TAU_1')

subplot(2,3,6)
plot(t,TAU(2,:))
title('TAU_2')

%% c) Implement cal_traj() to compute a path.

Traj = cal_traj(via, q0, Tao, tBe, dt);


