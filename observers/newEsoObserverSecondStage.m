function [ z_hat2_p ] = newEsoObserverSecondStage( input )
    global cascadedESO Controller

    b_hat = Controller.adrc.inputMatrixEstimate;
    L = cascadedESO.gainVectorSecond;

    z_hat2 = input(1:3);
    z_hat = input(4:6);
    u = input(7);

    Ao = [0 1 0;...
         0 0 1;...
         0 0 0];
    Bo = [0; -b_hat; 0];

    z_hat2_p = Ao*z_hat2 + Bo*u - Bo*1/b_hat*z_hat(3) + L*(z_hat(1) - z_hat2(1));
end

