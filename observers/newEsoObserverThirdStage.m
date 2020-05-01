function [ z_hat3_p ] = newEsoObserverThirdStage( input )
    global cascadedESO Controller

    b_hat = Controller.adrc.inputMatrixEstimate;
    L = cascadedESO.gainVectorThird;

    z_hat3 = input(1:3);
    z_hat = input(4:6);
    z_hat2 = input(7:9);
    u = input(10);

    Ao = [0 1 0;...
         0 0 1;...
         0 0 0];
    Bo = [0; -b_hat; 0];

    z_hat3_p = Ao*z_hat3 + Bo*1/b_hat^2*u - Bo*1/b_hat*(z_hat(3)+z_hat2(3)) + L*(z_hat2(1) - z_hat3(1));
end

