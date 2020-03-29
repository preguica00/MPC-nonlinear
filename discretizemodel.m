function [x1, x2] = discretizemodel(v, theta, H,x1_init,x2_init)

    Ts = 1;
    
    % Predicted trajectory
    x1 = nan(H+1, 1);
    x2 = nan(H+1, 1);
    
    % Set initial condition at start of trajectory
    x1(1) = x1_init;
    x2(1) = x2_init;
    % Run discrete prediction
    for i = 1:H
        x1(i+1) = x1(i) + Ts*v(i)*cos(theta(i));
        x2(i+1) = x2(i) + Ts*v(i)*sin(theta(i));
    end
    
    % Remove initial state from predicted trajectory
    x1 = x1(2:end);
    x2 = x2(2:end);
end