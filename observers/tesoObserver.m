function [ z_hat_p ] = tesoObserver( input )
    global TESO Controller

    b_hat = Controller.adrc.inputMatrixEstimate;
    L = TESO.gainVectorN3;
    rhoZero = TESO.rhoZero;
    rhoInfty = TESO.rhoInfty;
    l = TESO.l;

    z_hat = input(1:3);
    y = input(4);
    u = input(5);
    t = input(6);

    Ao = [0 1 0;...
         0 0 1;...
         0 0 0];
    Bo = [0; -b_hat; 0];
    
    rho = (rhoZero-rhoInfty)*exp(-l*t)+rhoInfty;
    Rho = [1; rho; rho];
    
    z_hat_p = Ao*z_hat + Bo*u + L.*Rho*(y - z_hat(1));
end

