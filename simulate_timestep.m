function current_state = simulate_timestep(current_state, command)

Ts=1;
tspan = [0 Ts];

my_ode = @(t,y) dotx(t,y,command);
[t, y] = ode45(my_ode,tspan, current_state)

current_state = [y(end,1), y(end,2)];
end