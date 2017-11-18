function [ P ] = cal_ss()
%CAL_SS Summary of this function goes here
%   Detailed explanation goes here

i=1;
for t=linspace(0,pi,100)

    oTa = trotz(t) * transl(4, 0, 0);
    aTb = trotz(0) * transl(3, 0, 0);
    bTe = trotz(0) * transl(2, 0, 0);

    T = oTa * aTb * bTe; 
    P(1,i) = T(1,4);
    P(2,i) = T(2,4);
    i=i+1;

end

