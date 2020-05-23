function [z_hat] = cresoExtendedStateSelectorN2(input)

z_hat_1 = input(1:5);
z_hat_2 = input(6:10);

z_hat = [z_hat_2(1:2); z_hat_1(3)+z_hat_2(3)];
end

