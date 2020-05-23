function [ out ] = transferFunction( input )
    global Plant

    A = Plant.transferFunction.A;
    B = Plant.transferFunction.B;
    C = Plant.transferFunction.C;

    x = input(1:2);
    u = input(3);

    xp = A*x+B*u;

    out = xp;
end

