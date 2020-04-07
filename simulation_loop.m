function simulation_loop()

    close all
    clf
    hold on
    plot_prediction = plot(0,0,'or-');
    plot_trajectory = plot(0,0,'db-');
    axis equal
    xlim([0 60])
    ylim([0 60])
    
    current_state = [0; 0];
    current_MPC_solution = [];
    
    [H, Ts, id_v, id_theta,id_x1,id_x2] = parameters;
    [xobs,yobs, obj_coord,radius] = obstacle;
        plot(xobs,yobs);

    for k = 1:50
        
        %% Run the controller
        [command, current_MPC_solution, predicted_trajectory] = ...
            mpcoptimizetrajectory(current_state, current_MPC_solution);
        
        %% Run the simulation
        current_state = simulate_timestep(current_state, command);

        %% Visualize
        plot_prediction.XData = predicted_trajectory(:,1);
        plot_prediction.YData = predicted_trajectory(:,2);
        plot_trajectory.XData(end+1) = current_state(1);
        plot_trajectory.YData(end+1) = current_state(2);
        
        drawnow
        pause(0.05)
    end

end