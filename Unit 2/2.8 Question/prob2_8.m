% M-file: prob2_8.m
% M-file to calculate and plot the secondary voltage
% of a transformer as a function of load for power
% factors of 0.8 lagging, 1.0, and 0.8 leading.
% These calculations are done using an equivalent
% circuit referred to the primary side.
% Define values for this transformer
VP = 15000; % Primary voltage (V)
amps = 0:166.67:16667; % Current values (A)
Req = 0.0135; % Equivalent R (ohms)
Xeq = 0.0563; % Equivalent X (ohms)
% Calculate the current values for the three
% power factors. The first row of I contains
% the lagging currents, the second row contains
% the unity currents, and the third row contains

% the leading currents.
I(1,:) = amps .* ( 0.8 - j*0.6); % Lagging
I(2,:) = amps .* ( 1.0 ); % Unity
I(3,:) = amps .* ( 0.8 + j*0.6); % Leading
% Calculate VS referred to the primary side
% for each current and power factor.
aVS = VP - (Req.*I + j.*Xeq.*I);
% Refer the secondary voltages back to the
% secondary side using the turns ratio.
VS = aVS * (200/15);
% Plot the secondary voltage (in kV!) versus load
plot(amps,abs(VS(1,:)/1000),'b-','LineWidth',2.0);
hold on;
plot(amps,abs(VS(2,:)/1000),'k--','LineWidth',2.0);
plot(amps,abs(VS(3,:)/1000),'r-.','LineWidth',2.0);
title ('\bfSecondary Voltage Versus Load');
xlabel ('\bfLoad (A)');
ylabel ('\bfSecondary Voltage (kV)');
legend('0.8 PF lagging','1.0 PF','0.8 PF leading');
grid on;
hold off;