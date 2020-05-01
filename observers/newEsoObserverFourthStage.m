function [ z_hat4_p ] = newEsoObserverFourthStage( input )
    global cascadedESO Controller

    b_hat = Controller.adrc.inputMatrixEstimate;
    L = cascadedESO.gainVectorFourth;

    z_hat4 = input(1:3);
    z_hat = input(4:6);
    z_hat2 = input(7:9);
    z_hat3 = input(10:12);
    u = input(13);

    Ao = [0 1 0;...
         0 0 1;...
         0 0 0];
    Bo = [0; -b_hat; 0];

    z_hat4_p = Ao*z_hat4 + Bo*1/b_hat^2*u - Bo*1/b_hat*(z_hat(3)+z_hat2(3)+z_hat3(3)) + L*(z_hat3(1) - z_hat4(1));
end

