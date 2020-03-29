


%parameters
alpha=1;
beta=1;
gamma=1;
delta=1;

%initial positions
% X1A=0.1;
% %X2A=1;
% X1B=1.1;
% X2B=2;

% Initial conditions
    x1_init = 0;
    x2_init = 0;
    v_init = 0.1;
    theta_init =1;
%prediction horizont
H=5;
id_v = 1:H;
id_theta = (1:H) + H;

%initial conditions
init=linspace(0,1,2*H);
% tspan=0.1; 
for k=1:10
[y_optimum, ~] = fmincon(@(y)costfunction(y, H, x1_init, x2_init, v_init, theta_init),init);

v_optimum = y_optimum(id_v);
theta_optimum = y_optimum(id_theta);
end

function cost = costfunction(y, H, x1_init, x2_init, v_init, theta_init)
%initial and final positions
x1_final=60;
x2_final=60;

%initial conditions
id_v = 1:H;
id_theta = (1:H) + H;
%y = randn(2*H,1);

% Unpacking
v = y(id_v);
theta = y(id_theta);

[x1,x2] = discretizemodel(v, theta,H,x1_init,x2_init, v_init, theta_init)

cost = sum((x1(:)-x1_final).^2+(x2(:)-x2_final).^2 + (v(:)).^2+ (theta(:)).^2);   
plot(x1,x2)
end



% %y = zeros(2*H,1);
% id_v = 1:H;
% id_theta = (1:H) + H;
% v = 0.5 * ones(H,1);
% theta = linspace(0,1,H);
% y(id_v) = v;
% y(id_theta) = theta;
% costfunction(y,H);



% function xdot = system(~,x)
%     % System dynamics
%     xdot = zeros(2,1);
% 
%     xdot(1) = x(4) +cos(x(3));
%     xdot(2) = x(3) +sin(x(3));
%     
% end
% 
% function [x] = dynamic(tspan, init)
%     %discretize the system using (ode45)
%     
%     % Set options
% %    atol_ode  = 1e-4;
%  %   rtol_ode  = 1e-4;
%   %  options = odeset('AbsTol', atol_ode, 'RelTol', rtol_ode);
%     
%     % Evaluate the system dynamics (integration)
%     [t, x] = ode45(@system, tspan, init);
%   
% 
% 
% end
% 
% function [c, ceq] = nlcon(x,tspan,init)
%  ceq = [];
%  c =[];
%    %terminal constraint
%   xdott = dynamic(tspan,init);
%   c = [0, 0];
%   ceq = [x1dott(1), x2dott(2)]; %x1dot=0 and %x2dot = 0
%     
% end