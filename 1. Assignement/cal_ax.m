function [ k, theta ] = cal_ax( T )
%CAL_AX Summary of this function goes here
%   Detailed explanation goes here

nx = T(1,1); sx = T(1,2); ax = T(1,3);
ny = T(2,1); sy = T(2,2); ay = T(2,3);
nz = T(3,1); sz = T(3,2); az = T(3,3);

ct = 1/2*(nx+sy+az-1);
st_1 = 1/2*sqrt( (sz-ay)^2 + (ax-nz)^2 + (ny-sx)^2 );
st_2 = -1/2*sqrt( (sz-ay)^2 + (ax-nz)^2 + (ny-sx)^2 );

disp(sign(sz - ay))
disp(sign(ax - nz))
disp(sign(ny - sx))

if(sign(sz - ay))

theta_1 = atan2(st_1,ct);
% theta_2 = atan2(st_2,ct);

theta = theta_1;

kx = 1/(2*sin(theta)) * (sz - ay);
ky = 1/(2*sin(theta)) * (ax - nz);
kz = 1/(2*sin(theta)) * (ny - sx);

k = [kx; ky; kz];

end

