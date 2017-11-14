function [ k, theta ] = cal_ax( T )
%CAL_AX Summary of this function goes here
%   Detailed explanation goes here

nx = T(1,1); sx = T(1,2); ax = T(1,3);
ny = T(2,1); sy = T(2,2); ay = T(2,3);
nz = T(3,1); sz = T(3,2); az = T(3,3);

kx = sz - ay;
ky = ax - nz;
kz = ny - sx;

k = [kx; ky; kz];
k = k/norm(k);

kx = k(1);
ky = k(2);
kz = k(3);

ct = 1/2*(nx+sy+az-1);
st1 = (sz - ay) / (2 * kx);
st2 = (ax - nz) / (2 * ky);
st3 = (ny - sx) / (2 * kz);

disp(st1)
disp(st2)
disp(st3)

theta= atan2(st1,ct);

end

