function  [command, y_optimum, predicted_trajectory] = ...
    mpcoptimizetrajectory(current_state, y_optimum)


    %parameters
    alpha=1;
    beta=1;
    gamma=1;
    delta=10;

    % Initial conditions
    x1_init = current_state(1);
    x2_init = current_state(2);
    
    [H, Ts, id_v, id_theta] = parameters;

    %initial conditions
    if isempty(y_optimum)
        y_optimum = zeros(2*H,1);
    end

    [y_optimum, ~] = fmincon(@(y)costfunction(y, H, x1_init, x2_init, alpha, beta, gamma, delta), y_optimum);
    theta_optimum = y_optimum(id_theta);
    v_optimum = y_optimum(id_v);
    command = [v_optimum(1), theta_optimum(1)];

    [x1,x2] = discretizemodel(v_optimum, theta_optimum,x1_init,x2_init);
    predicted_trajectory = [x1,x2];

    
end


