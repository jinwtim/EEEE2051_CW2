% Tim
% Student ID: 20612520
% Task II - Runtime vs maximum timestep

clear; clc; close all;

timestep = [1e-6 10e-6 100e-6 10e-3];   % seconds
runtime  = [0.3324 0.1082 0.0318 0.0154];   % average runtime in seconds

figure('Color','w');
semilogx(timestep, runtime, '-o', 'LineWidth', 2, 'MarkerSize', 8);
grid on;

xlabel('Maximum timestep (s)', 'FontSize', 12);
ylabel('Average simulation runtime (s)', 'FontSize', 12);
title('Simulation Runtime versus Maximum Timestep', 'FontSize', 13);

set(gca, 'FontSize', 11, 'LineWidth', 1.2);
ylim([0 0.36]);