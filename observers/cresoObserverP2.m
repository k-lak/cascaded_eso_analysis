function [ out ] = cresoObserverP2( input )
    global cascadeRESO Controller

    b_hat = Controller.adrc.inputMatrixEstimate;
    L1 = cascadeRESO.gainVectorFirst;
    L2 = cascadeRESO.gainVectorSecond;
    omega_1 = cascadeRESO.pulsationFirst;
    omega_2 = cascadeRESO.pulsationSecond;

    z_hat1 = input(1:5);
    z_hat2 = input(6:10);
    y = input(11);
    u = input(12);
    
    Ao1 = [0 1 0 0 0;...
         0 0 1 0 0;...
         0 0 0 1 0;...
         0 0 0 0 1;...
         0 0 0 -omega_1^2 0];
    Ao2 = [0 1 0 0 0;...
         0 0 1 0 0;...
         0 0 0 1 0;...
         0 0 0 0 1;...
         0 0 0 -omega_2^2 0];
    Bo = [0; -b_hat; 0; 0; 0];

    z_hat1_p = Ao1*z_hat1 + Bo*u + L1*(y - z_hat1(1));
    z_hat2_p = Ao2*z_hat2 + Bo*u - Bo*1/b_hat*z_hat1(3) + L2*(y - z_hat2(1));
    
    out = [z_hat1_p; z_hat2_p]; 
end

