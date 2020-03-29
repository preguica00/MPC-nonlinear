function nonlinearmpc = mpcoptimizetrajectory()



%parameters
alpha=1;
beta=1;
gamma=1;
delta=1;

% Initial conditions
x1_init = 0;
x2_init = 0;
v_init = 0.1;
theta_init =1;

%prediction horizont
H=5;
id_v = 1:H;
id_theta = (1:H) + H;

%initial conditions
init=linspace(0,1,2*H);

for k=1:10
    [y_optimum, ~] = fmincon(@(y)costfunction(y, H, x1_init, x2_init, alpha, beta, gamma, delta),init);
    
    v_optimum = y_optimum(id_v);
    theta_optimum = y_optimum(id_theta);
end



