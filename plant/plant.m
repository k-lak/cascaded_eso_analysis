function [ out ] = plant( input )
    global Plant

    A = Plant.A;
    B = Plant.B;
    C = Plant.C;

    x = input(1:2);
    u = input(3);

    xp = A*x+B*u;

    out = xp;
end

