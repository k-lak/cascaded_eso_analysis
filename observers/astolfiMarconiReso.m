function [ out ] = astolfiMarconiReso( input )
    global amRESO Controller

    l = amRESO.l;
    K1 = amRESO.K1;
    K2 = amRESO.K2;
    K3 = amRESO.K3;
    K4 = amRESO.K4;
    omega = amRESO.pulsation;
    b_hat = Controller.adrc.inputMatrixEstimate;

    z = input(1:5);
    xi = input(6:13);
    y = input(14);
    u = input(15);

    xi1 = xi(1:2);
    xi2 = xi(3:4);
    xi3 = xi(5:6);
    xi4 = xi(7:8);

    B = [0; 1];
    C = [1 0];

    xi11p = B' * xi1 + l * K1(1) * (y - C * xi1);
    xi12p = B' * xi2 - b_hat * u + l ^ 2 * K1(2) * (y - C * xi1);
    xi21p = B' * xi2 - b_hat * u + l * K2(1) * (B' * xi1 - C * xi2);
    xi22p = B' * xi3 + l ^ 2 * K2(2) * (B' * xi1 - C * xi2);
    xi31p = B' * xi3 + l * K3(1) * (B' * xi2 - C * xi3);
    xi32p = B' * xi4 + l ^ 2 * K3(2) * (B' * xi2 - C * xi3);
    xi41p = B' * xi4 + l * K4(1) * (B' * xi3 - C * xi4);
    xi42p = -omega ^ 2 * xi4(1) + l ^ 2 * K4(2) * (B' * xi3 - C * xi4);


    out = [xi11p xi12p xi21p xi22p xi31p xi32p xi41p xi42p]';
end

