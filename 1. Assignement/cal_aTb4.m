function [ aTb4 ] = cal_aTb4(phi, theta, psi, pSb)
%CAL_ATB4 Summary of this function goes here
%   Detailed explanation goes here

aRb = trotz(phi)*troty(theta)*trotz(psi);

aTb4 = transl(pSb)*aRb;

end

