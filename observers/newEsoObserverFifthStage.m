function [ z_hat5_p ] = newEsoObserverFifthStage( input )
    global cascadedESO Controller

    b_hat = Controller.adrc.inputMatrixEstimate;
    L = cascadedESO.gainVectorFifth;

    z_hat5 = input(1:3);
    z_hat = input(4:6);
    z_hat2 = input(7:9);
    z_hat3 = input(10:12);
    z_hat4 = input(13:15);
    u = input(16);

    Ao = [0 1 0;...
         0 0 1;...
         0 0 0];
    Bo = [0; -b_hat; 0];

    z_hat5_p = Ao*z_hat5 + Bo*1/b_hat^2*u - Bo*1/b_hat*(z_hat(3)+z_hat2(3)+z_hat3(3)+z_hat4(3)) + L*(z_hat4(1) - z_hat5(1));
end

