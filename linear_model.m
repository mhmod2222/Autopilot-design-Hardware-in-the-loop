% state space model
A = [-0.727 345.2118852 0;
     -0.08  -0.745      0;
     0      1           0];
B = [-20.7 ; -23.5 ; 0];
C = [0 0 1];
D = zeros(size(C,1),size(B,2));

% LQR
p = 60;                   % weighting factor
Q = p*(C')*C;             % state-cost weighted matrix
R = 1;                    % the control weighted matrix
[K] = lqr(A,B,Q,R);       % best gains
Nbar = K(3); % precompensator

sys_cl = ss(A-B*K,B*Nbar,C,D);
step(0.2*sys_cl)
title('Pitch angle theta')
xlim([0 10])
