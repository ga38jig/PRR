function [ oTe, rx, ry, ph ] = vwl( theta1, theta2, theta3 )
%VWL Summary of this function goes here
%   Detailed explanation goes here

oTa = trotz(theta1) * transl(4, 0, 0);
aTb = trotz(theta2) * transl(3, 0, 0);
bTe = trotz(theta3) * transl(2, 0, 0);

oTe = oTa * aTb * bTe;
rx = oTe(1,4);
ry = oTe(2,4);
ph = theta1 + theta2 + theta3;

end

