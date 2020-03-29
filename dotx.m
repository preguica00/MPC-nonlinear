function dydt = dotx(t,y,u)

v = u(1);
theta = u(2);

x1_dot = v * cos(theta);
x2_dot = v * sin(theta);

dydt = [x1_dot; x2_dot];

end