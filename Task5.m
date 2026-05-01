% Wong Jin Tim
% Student ID: 20612520
% Task V: Inspect LTspice data spacing

clc;
clear;
close all;

% Import LTspice exported text file
data = readtable('Task5.txt', ...
    'FileType', 'text', ...
    'Delimiter', '\t', ...
    'VariableNamingRule', 'preserve');

% Extract columns
t  = data{:,1};        % time
vR = data{:,2};        % V(Vin,Vc) = resistor voltage
vC = data{:,3};        % V(vc) = capacitor voltage
iC = data{:,4};        % I(C1) = capacitor current

% Calculate spacing between consecutive time points
dt = diff(t);

% Convert spacing to microseconds for easier reading
dt_us = dt * 1e6;

% Display results
fprintf('Number of data points: %d\n', length(t));
fprintf('Number of intervals: %d\n', length(dt));
fprintf('Minimum spacing = %.9e s = %.6f us\n', min(dt), min(dt_us));
fprintf('Maximum spacing = %.9e s = %.6f us\n', max(dt), max(dt_us));
fprintf('Mean spacing    = %.9e s = %.6f us\n', mean(dt), mean(dt_us));

disp('First 20 spacing values in microseconds:');
disp(dt_us(1:20));

% Check whether spacing is uniform
tolerance = 1e-12;

if max(dt) - min(dt) < tolerance
    disp('The data spacing is approximately uniform.');
else
    disp('The data spacing is not perfectly uniform.');
end

% Plot spacing
figure;
plot(dt_us(3:end-1), 'o-');
xlabel('Interval number');
ylabel('\Delta t (\mus)');
title('Spacing Between Consecutive Exported LTspice Time Points');
grid on;
