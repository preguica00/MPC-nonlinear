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
    
    [H, Ts, id_v, id_theta,id_x1,id_x2] = parameters;

    %initial conditions
    if isempty(y_optimum)
        y_optimum = zeros(4*H,1);
    end

    [y_optimum, ~] = fmincon(@(y)costfunction(y, H,alpha, beta, gamma, delta), y_optimum,[],[],[],[],[],[],@(y)discretizemodel(y,x1_init,x2_init));
    theta_optimum = y_optimum(id_theta);
    v_optimum = y_optimum(id_v);
    command = [v_optimum(1), theta_optimum(1)];


    x1_optimum = y_optimum(id_x1);
    x2_optimum = y_optimum(id_x2);
    predicted_trajectory = [x1_optimum,x2_optimum];
end


