function [c, ceq] = discretizemodel(y,x1_init,x2_init)

[H, Ts, id_v, id_theta,id_x1,id_x2] = parameters;
[xobs,yobs,obj_coord, radius] = obstacle;

% Predicted trajectory
x1 = nan(H+1, 1);
x2 = nan(H+1, 1);
x1(1)=x1_init;
x2(1)=x2_init;
distanceminx1=  zeros(H, 1);
distanceminx2=  zeros(H, 1);
obsx=  zeros(H, 1);
obsy=  zeros(H, 1);

% Set initial condition at start of trajectory

v = y(id_v);
theta = y(id_theta);
x1hat = y(id_x1);
x2hat = y(id_x2);

% Run discrete prediction
for i = 1:H
    x1(i+1) = x1(i) + Ts*v(i)*cos(theta(i));
    x2(i+1) = x2(i) + Ts*v(i)*sin(theta(i));
    obsx(i)=obj_coord(1);
    obsy(i)=obj_coord(2);
end

x1 = x1(2:end);
x2 = x2(2:end);
ceq = [x1-x1hat,x2-x2hat];


%I defined a miniminal distance that is the radius+1
for j=1:H
        distanceminx1(j)=radius(1)+radius(2);
        distanceminx2(j)=radius(1)+radius(2);
end


c= [distanceminx1;distanceminx2]-vecnorm([x1;x2]-[obsx;obsy]);
        
end