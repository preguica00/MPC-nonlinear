function [H, Ts, id_v, id_theta,id_x1,id_x2] = parameters
    
    H = 10;
    Ts = 0.1;
    id_v = 1:H;
    id_theta = (1:H) + H;
    id_x1= (1:H) + 2*H;
    id_x2 = (1:H) + 3*H;
end

