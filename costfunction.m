function cost = costfunction(y, H,alpha, beta, gamma, delta)

    %initial and final positions
    x1_final=60;
    x2_final=60;


    [H, Ts, id_v, id_theta,id_x1,id_x2] = parameters;

    % Unpacking
    v = y(id_v);
    theta = y(id_theta);
    x1 = y(id_x1);
    x2 = y(id_x2);
%     [x1,x2] = discretizemodel(v, theta,x1_init,x2_init);

%     plot(x1,x2)
    cost = sum(alpha*(x1(:)-x1_final).^2+beta*(x2(:)-x2_final).^2 + gamma*(v(:)).^2+ delta*(theta(:)).^2);   

end