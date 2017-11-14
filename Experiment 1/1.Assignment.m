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

% phi =
% tht =
% psi =

% aTb4 = cal_aTb4


