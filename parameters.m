function [H, Ts, id_v, id_theta] = parameters
    
    H = 10;
    Ts = 0.1;
    id_v = 1:H;
    id_theta = (1:H) + H;
    
end

