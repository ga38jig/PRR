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

disp("TEST: Test cal_ax  with results from cal_aTb5.")

T_ = cal_aTb5([0;1;0], pi/2)

[k_, theta_] = cal_ax(T_)

%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Exercise 2: DH Convention and FWD Kinematics %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

%% a) Write down parameters in a table.

L1=4;
L2=3;
L3=2;

disp(" Link | a_i | alpha_i | d_i | theta_i ")
disp("  0   | 0   |   0     |  0  |    0    ")
disp("  1   | 4   |   0     |  0  |  theta1 ")
disp("  2   | 3   |   0     |  0  |  theta2 ")
disp("  3   | 2   |   0     |  0  |  theta3 ")
disp(newline)

%% b) Compute 0TE manually and extract position (rx, ry) and orientation (phi).

theta1 = pi;
theta2 = pi/2;
theta3 = pi/3;

oTa = trotz(theta1) * transl(4, 0, 0);
aTb = trotz(theta2) * transl(3, 0, 0);
bTe = trotz(theta3) * transl(2, 0, 0);

oTe1 = oTa * aTb * bTe;

syms theta1_ theta2_ theta3_
syms oTe_(theta1_, theta2_, theta3_)

oTe_(theta1_,theta2_,theta3_)=transl(4, 0, 0) * trotz(theta1_)...
                        * transl(3, 0, 0) * trotz(theta2_)...
                        * transl(2, 0, 0) * trotz(theta3_);
                    
oTe_sym = vpa(oTe_(theta1, theta2, theta3),5);

rx = oTe1(1,4);
ry = oTe1(2,4);
ph = theta1 + theta2 + theta3;

oTe1

%% c) Implement vwl to compute forward kinematics of the robot.

[ oTe2, rx, ry, ph ] = vwl(theta1, theta2, theta3);
oTe2

%% TEST: Use functions Link(), SerialLink() and fkine() to test results.

L(1) = Link('d', 0, 'a', 4, 'alpha', 0);
L(2) = Link('d', 0, 'a', 3, 'alpha', 0);
L(3) = Link('d', 0, 'a', 2, 'alpha', 0);
q=[theta1,theta2,theta3];

planar_robot = SerialLink(L, 'name', 'planar_robot');

oTe3 = planar_robot.fkine(q);

oTe3

%% d) Implement cal_ss to compute the work space of the robot.

P = cal_ss();

%% TEST: Draw the workspace of the robot and animate it with teach().

plot(P(1,:),P(2,:))

%planar_robot.teach([0,0,0], 'deg')

planar_robot.teach([pi/2,-pi/4, -pi/3])





