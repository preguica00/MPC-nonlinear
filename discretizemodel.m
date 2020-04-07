function [c, ceq] = discretizemodel(y,x1_init,x2_init)

[H, Ts, id_v, id_theta,id_x1,id_x2] = parameters;
[xobs,yobs,obj_coord, radius] = obstacle;


v = y(id_v);
theta = y(id_theta);
x1 = [x1_init; y(id_x1)];
x2 = [x2_init; y(id_x2)];

% Run discrete prediction
ceq = [];
for i = 1:H
    ceq(end+1) = x1(i+1) - (x1(i) + Ts*v(i)*cos(theta(i)));
    ceq(end+1) = x2(i+1) - (x2(i) + Ts*v(i)*sin(theta(i)));
end


x1 = y(id_x1);
x2 = y(id_x2);

c = sum(radius) - vecnorm([x1';x2']-obj_coord);
        
end