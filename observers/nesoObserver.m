function [ z_hat_p ] = nesoObserver( input )
    global NESO Controller

    b_hat = Controller.adrc.inputMatrixEstimate;
    w0L = NESO.w0L;
    w0H = NESO.w0H;
    d = NESO.d;

    z_hat = input(1:3);
    y = input(4);
    u = input(5);

    Ao = [0 1 0;...
         0 0 1;...
         0 0 0];
    Bo = [0; -b_hat; 0];
    
    g1 = w0H;
    g2 = w0L;
    
    h1 = 3 * (g1*(y - z_hat(1)) + d*(g2-g1) * sat((y - z_hat(1))/d));
    h2 = 3 * (g1^2*(y - z_hat(1)) + d*(g2^2-g1^2) * sat((y - z_hat(1))/d));
    h3 = g1^3*(y - z_hat(1)) + d*(g2^3-g1^3) * sat((y - z_hat(1))/d);
    L = [h1;h2;h3];

    z_hat_p = Ao*z_hat + Bo*u + L;
end

