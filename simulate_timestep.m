function current_state = simulate_timestep(current_state, command)

    [H, Ts, id_v, id_theta,id_x1,id_x2] = parameters;

    tspan = [0 Ts];

    my_ode = @(t,y) dotx(t,y,command);
    [~, y] = ode45(my_ode,tspan, current_state);
    current_state = [y(end,1), y(end,2)];
    
end