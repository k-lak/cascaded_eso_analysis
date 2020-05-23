function [ out ] = astolfiMarconiEsoN3( input )
    global amESO Controller

    l = amESO.l;
    K1 = amESO.K1n3;
    K2 = amESO.K2n3;
    b_hat = Controller.adrc.inputMatrixEstimate;

    z = input(1:3);
    xi = input(4:7);
    y = input(8);
    u = input(9);

    xi1 = xi(1:2);
    xi2 = xi(3:4);

    B = [0; 1];
    C = [1 0];

    xi11p = B' * xi1 + l * K1(1) * (y - C * xi1);
    xi12p = B' * xi2 - b_hat * u + l ^ 2 * K1(2) * (y - C * xi1);
    xi21p = B' * xi2 - b_hat * u + l * K2(1) * (B' * xi1 - C * xi2);
    xi22p = l ^ 2 * K2(2) * (B' * xi1 - C * xi2);


    out = [xi11p xi12p xi21p xi22p]';
end

