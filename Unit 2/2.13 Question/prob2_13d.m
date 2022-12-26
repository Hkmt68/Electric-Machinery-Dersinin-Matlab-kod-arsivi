% M-file: prob2_13d.m
% M-file to calculate and plot the voltage regulation
% of a three-phase Y-delta transformer bank as a
% function of load for power factors of 0.85 lagging,
% 1.0, and 0.85 leading. These calculations are done
% using an equivalent circuit referred to the primary side.

% Define values for this transformer
VL = 14400; % Primary line voltage (V)
VPP = VL / sqrt(3); % Primary phase voltage (V)
amps = 0:0.01203:12.03; % Phase current values (A)
Req = 18.94; % Equivalent R (ohms)
Xeq = 35.77; % Equivalent X (ohms)
% Calculate the current values for the three
% power factors. The first row of I contains
% the lagging currents, the second row contains
% the unity currents, and the third row contains
% the leading currents.
re = 0.85;
im = sin(acos(re));
I = zeros(3,length(amps));
I(1,:) = amps .* ( re - j*im); % Lagging
I(2,:) = amps .* ( 1.0 ); % Unity
I(3,:) = amps .* ( re + j*im); % Leading
% Calculate secondary phase voltage referred
% to the primary side for each current and
% power factor.
aVSP = VPP - (Req.*I + j.*Xeq.*I);
% Calculate the voltage regulation.
VR = (VPP - abs(aVSP)) ./ abs(aVSP) .* 100;
% Plot the voltage regulation versus load
plot(amps,VR(1,:),'b-','LineWidth',2.0);
hold on;
plot(amps,VR(2,:),'k--','LineWidth',2.0);
plot(amps,VR(3,:),'r-.','LineWidth',2.0);
title ('\bfVoltage Regulation Versus Load');
xlabel ('\bfLoad (A)');
ylabel ('\bfVoltage Regulation (%)');
legend('0.85 PF lagging','1.0 PF','0.85 PF leading');
grid on;
hold off;