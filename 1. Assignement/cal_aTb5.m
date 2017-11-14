function [ aTb5 ] = cal_aTb5(k, t)
%CAL_ATB5 Summary of this function goes here
%   Detailed explanation goes here

kx = k(1);
ky = k(2);
kz = k(3);
    
matrix = [kx*kx*v(t), ky*kx*v(t), kz*kx*v(t);...
        kx*ky*v(t), ky*ky*v(t), kz*ky*v(t);...
        kx*kz*v(t), ky*kz*v(t), kz*kz*v(t)];
    
dg = diag([cos(t) cos(t) cos(t)]);
    
sk = skew([kx*sin(t); ky*sin(t); kz*sin(t)]);
    
aTb5 = [matrix + dg + sk, zeros(3,1); zeros(1,3), 1];

end


function [ y ] = v(x)
    y=(1-cos(x));
end
