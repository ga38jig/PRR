function [Q,Q1,Q2,W,t] = constVel(q0,w0,dt,T)
%CONSTVEL Summary of this function goes here
%   Detailed explanation goes here
L1 = Link('revolute', 'd', 0 , 'a', 1, 'alpha', 0);
L2 = Link('revolute', 'd', 0 , 'a', 1, 'alpha', 0);
Robot = SerialLink([L1,L2]);

FUNC = @(t,q)func(Robot,w0,q);
[t,Q] = ode45(FUNC,[0:dt:T+dt],q0);
Q = Q';
Q1 = zeros(2,(T/dt)+1);
Q2 = zeros(2,(T/dt)+1);
W = zeros(2,(T/dt)+1);
i = 1;
t = zeros(1,(T/dt)+1);
ti = 0;

for time = 0:dt:T+dt
    q1 = func(Robot,w0,Q(:,i));
    w = Robot.fkine(Q(:,i));
    ti = ti + dt;

    if time == 0        
        Q1(1:2,i) = [q1(1); q1(2)];
        W(1:2,i) = [w(1,4); w(2,4)];
        t(1,i) = [ti];
    else
        if time==T+dt
            q1fin = func(Robot,w0,Q(:,i));
            q2 = (q1fin -Q1(:,i-1)) / dt;
            Q2(1:2,i-1) = [q2(1); q2(2)];
            Q = Q(:,1:i-1);
        else
            Q1(1:2,i) = [q1(1); q1(2)];             
            W(1:2,i) = [w(1,4); w(2,4)];            
            t(1,i) = [ti];
            q2 = (Q1(:,i)-Q1(:,i-1)) / dt;
            Q2(1:2,i-1) = [q2(1); q2(2)]; 
        end        
    end
    i = i + 1;
end
end

function [q1] = func(Robot,w0,q)
J0 = Robot.jacob0([q(1),q(2)]);
J = [J0(1,:); J0(2,:)];
q1 = inv(J) * w0;
end
