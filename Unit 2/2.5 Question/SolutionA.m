% M-file: prob2_5a.m
% M-file to calculate and plot the magnetization
% current of a 120/240 transformer operating at
% 120 volts and 60 Hz. This program also

% calculates the rms value of the mag. current.
% Load the magnetization curve. It is in two
% columns, with the first column being mmf and
% the second column being flux.
load p22_mag.dat;
mmf_data = p22_mag(:,1);
flux_data = p22_mag(:,2);
% Initialize values
S = 1000; % Apparent power (VA)
Vrms = 120; % Rms voltage (V)
VM = Vrms * sqrt(2); % Max voltage (V)
NP = 500; % Primary turns
% Calculate angular velocity for 60 Hz
freq = 60; % Freq (Hz)
w = 2 * pi * freq;
% Calculate flux versus time
time = 0:1/3000:1/30; % 0 to 1/30 sec
flux = -VM/(w*NP) * cos(w .* time);
% Calculate the mmf corresponding to a given flux
% using the MATLAB interpolation function.
mmf = interp1(flux_data,mmf_data,flux);
% Calculate the magnetization current
im = mmf / NP;
% Calculate the rms value of the current
irms = sqrt(sum(im.^2)/length(im));
disp(['The rms current at 120 V and 60 Hz is ', num2str(irms)]);
% Calculate the full-load current
i_fl = S / Vrms;
% Calculate the percentage of full-load current
percnt = irms / i_fl * 100;
disp(['The magnetization current is ' num2str(percnt) ...
'% of full-load current.']);
% Plot the magnetization current.
figure(1)
plot(time,im);
title ('\bfMagnetization Current at 120 V and 60 Hz');
xlabel ('\bfTime (s)');
ylabel ('\bf\itI_{m} \rm(A)');
axis([0 0.04 -0.5 0.5]);
grid on;