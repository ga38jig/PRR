function [TAU] = invdyn(Q,Q1,Q2)
%INVDYN Summary of this function goes here
%   Detailed explanation goes here
m = 7806 * (0.05*0.05*1);
l = 1;
g= 9.81;
Mass =  [5/3 + cos(Q(2)),     1/3+1/2*cos(Q(2));
         1/3+1/2*cos(Q(2)),   1/3             ];
Centr = [-sin(Q(2))*Q1(1)*Q1(2)-1/2*sin(Q(2))*(Q1(2))^2 ;
                1/2*sin(Q(2))*(Q1(1))^2];
Grav = [3/2*cos(Q(1))+1/2*cos(Q(1)+Q(2)); 1/2*cos(Q(1)+Q(2))];
TAU = m*l^2*Mass*Q2 + m*l^2*Centr + m*g*l*Grav;
end

