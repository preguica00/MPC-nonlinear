function  [command, current_MPC_solution, predicted_trajectory] = mpcoptimizetrajectory(current_state, current_MPC_solution)


%parameters
alpha=1;
beta=1;
gamma=1;
delta=1;

% Initial conditions
x1_init = 0;
x2_init = 0;

%prediction horizont
H=5;
id_v = 1:H;
id_theta = (1:H) + H;

%initial conditions
init=linspace(0,1,2*H);

    [y_optimum, ~] = fmincon(@(y)costfunction(y, H, x1_init, x2_init, alpha, beta, gamma, delta),init);
    theta_optimum = y_optimum(id_theta);
    v_optimum = y_optimum(id_v);
    command = [v_optimum(1), theta_optimum(1)];
    current_MPC_solution = y_optimum;
    
    [x1,x2] = discretizemodel(v_optimum, theta_optimum,H,x1_init,x2_init);
    predicted_trajectory = [x1,x2];
    
   

