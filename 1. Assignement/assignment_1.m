%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Exercise 1: Transformation Matrices %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

%% a) Compute transformation matrices.

pSb = [0.5;0;0];

T1 = transl(pSb);

T2 = troty(90, 'deg');

T3 = trotz(-90, 'deg');

%% b) Compare commutativity.

aTb = T1*T2*T3;

aTb1 = T3*T2*T1;

%% c) Implement cal_ap to compute ap relative to frame Sa.

bp = [0;0;1];

ap = cal_ap(bp);

%% d) Compute RPY angles using tr2rpy().

RPY = tr2rpy(aTb, 'zyx');

%% e) Implement cal_aTb2 to compute aTb2 from a set of RPY angles.

alp = RPY(1);
bet = RPY(2);
gam = RPY(3);
aTb2 = cal_aTb2(alp, bet, gam, pSb);

%% TEST: Compute aTb3 with rpy2tr(). Compare aTb2 and aTb3.

aTb3 = rpy2tr(alp, bet, gam, 'zyx');

disp("TEST: Compute aTb3 with rpy2tr(). Compare aTb2 and aTb3.")

aTb2

aTb3

%% f) Compute Euler angles using tr2eul().

EUL = tr2eul(aTb);

%% g) Implement cal_aTb4 to compute aTb4 from a set of Euler angles.

phi = EUL(1);
tht = EUL(2);
psi = EUL(3);

aTb4 = cal_aTb4(phi, tht, psi, pSb);

%% TEST: Compute aTb4_ with eul2tr(). Compare aTb4 and aTb4_.

aTb4_ = eul2tr(phi, tht, psi);

disp("TEST: Compute aTb4_ with eul2tr(). Compare aTb4 and aTb4_.")

aTb4

aTb4_

%% h) Implement cal_aTb5 to compute aTb5 from rotation axis and angle.

aTb5 = cal_aTb5([1;0;0], pi/2);

%% TEST: Compute rotations around x,y,z axes and compare with trot functions.

disp("TEST: Compute rotations around x,y,z axes and compare with trot functions.")
disp(newline)
disp("1. Rotation in x:")
disp(newline)
disp("cal_aTb5")
disp(cal_aTb5([1;0;0], pi/2))
disp("trotx")
disp(trotx(pi/2))
disp("2. Rotation in y:")
disp(newline)
disp("cal_aTb5")
disp(cal_aTb5([0;1;0], pi/2))
disp("troty")
disp(troty(pi/2))
disp("3. Rotation in z:")
disp(newline)
disp("cal_aTb5")
disp(cal_aTb5([0;0;1], pi/2))
disp("trotz")
disp(trotz(pi/2))

%% [BONUS] i) Implement cal_ax to compute k and theta from T.

[k, theta] = cal_ax(aTb5);

%% TEST: Test cal_ax  with results from cal_aTb5.

T = cal_aTb5([1;0;0], pi/2)

[k, theta] = cal_ax(T)



