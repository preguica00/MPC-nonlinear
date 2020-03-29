function cost = costfunction(y, H, x1_init, x2_init, alpha, beta, gamma, delta)
%initial and final positions
x1_final=60;
x2_final=60;

%initial conditions
id_v = 1:H;
id_theta = (1:H) + H;

% Unpacking
v = y(id_v);
theta = y(id_theta);

[x1,x2] = discretizemodel(v, theta,H,x1_init,x2_init)

cost = sum(alpha*(x1(:)-x1_final).^2+(beta*x2(:)-x2_final).^2 + (gamma*v(:)).^2+ (delta*theta(:)).^2);   
plot(x1,x2)
end