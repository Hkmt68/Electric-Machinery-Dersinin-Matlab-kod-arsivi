% M-file: prob2_10c.m
% M-file to calculate and plot the secondary voltage
% of a three-phase Y-delta transformer bank as a
% function of load for power factors of 0.85 lagging,
% 1.0, and 0.85 leading. These calculations are done
% using an equivalent circuit referred to the primary side.
% Define values for this transformer
VL = 13800; % Primary line voltage (V)
VPP = VL / sqrt(3); % Primary phase voltage (V)
amps = 0:0.0126:12.6; % Phase current values (A)
Req = 6.94; % Equivalent R (ohms)
Xeq = 24.7; % Equivalent X (ohms)
% Calculate the current values for the three
% power factors. The first row of I contains
% the lagging currents, the second row contains
% the unity currents, and the third row contains
% the leading currents.
re = 0.85;
im = sin(acos(re)); j = 1i;
I(1,:) = amps .* ( re - j*im); % Lagging
I(2,:) = amps .* ( 1.0 ); % Unity
I(3,:) = amps .* ( re + j*im); % Leading
% Calculate secondary phase voltage referred
% to the primary side for each current and
% power factor.
aVSP = VPP - (Req.*I + j.*Xeq.*I);
% Refer the secondary phase voltages back to
% the secondary side using the turns ratio.
% Because this is a delta-connected secondary,
% this is also the line voltage.
VSP = aVSP * (480/7967);
% Plot the secondary voltage versus load
plot(amps,abs(VSP(1,:)),'b-','LineWidth',2.0);
hold on;
plot(amps,abs(VSP(2,:)),'k--','LineWidth',2.0);
plot(amps,abs(VSP(3,:)),'r-.','LineWidth',2.0);
title ('\bfSecondary Voltage Versus Load');
xlabel ('\bfLoad (A)');
ylabel ('\bfSecondary Voltage (V)');
legend('0.85 PF lagging','1.0 PF','0.85 PF leading');
grid on;
hold off;