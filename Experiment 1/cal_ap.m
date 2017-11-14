function [ ap ] = cal_ap( bp )
%CAL_AP Computes ap relative to the coordinate frame Sa from a point bp
%relative to the coordinate frame Sb.

T1=transl(0.5,0,0);
T2=troty(90,'deg');
T3=trotz(-90,'deg');

aTb=T1*T2*T3;

bp=[bp; 1];

ap = aTb * bp;

ap = ap(1:3);

end

