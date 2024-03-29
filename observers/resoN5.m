function [ z_hat_p ] = resoN5( input )
    global RESO Controller

    b_hat = Controller.adrc.inputMatrixEstimate;
    L = RESO.gainVectorN5;
    omega = RESO.pulsation;

    z_hat = input(1:5);
    y = input(6);
    u = input(7);

    Ao = [0 1 0 0 0;...
         0 0 1 0 0;...
         0 0 0 1 0;...
         0 0 0 0 1;...
         0 0 0 -omega^2 0];
    Bo = [0; -b_hat; 0; 0; 0];

    z_hat_p = Ao*z_hat + Bo*u + L*(y - z_hat(1));
end

