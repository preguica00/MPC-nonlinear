function simulation_loop()

    clf
    hold on
    plot_prediction = plot(0,0,'or-');
    plot_trajectory = plot(0,0,'db-');
    
    current_state = [0; 0];
    current_MPC_solution = [];
    H=5;
    
    while true
        
        %% Run the controller
      
        [command,current_MPC_solution, predicted_trajectory] = mpcoptimizetrajectory(current_state, current_MPC_solution);
        
        %% Run the simulation
        current_state = simulate_timestep(current_state, command);

        %% Visualize
        plot_prediction.XData = predicted_trajectory(1,:);
        plot_prediction.YData = predicted_trajectory(2,:);
        
        plot_trajectory.XData(end+1) = current_state(1);
        plot_trajectory.YData(end+1) = current_state(2);
        
        drawnow
        pause(0.05)
    end

end