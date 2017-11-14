function [ aTb2 ] = cal_aTb2(alpha, beta, gamma, psb)
%CAL_ATB2 Summary of this function goes here
%   Detailed explanation goes here

aRb = trotz(alpha)*troty(beta)*trotx(gamma);

aTb2 = transl(psb)*aRb;


end

