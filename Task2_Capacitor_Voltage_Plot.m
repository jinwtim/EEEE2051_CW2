% Wong Jin Tim
% Student ID: 20612520
% Task II - Capacitor Voltage Plot

clear; clc; close all;

d1 = readmatrix('1us.txt');
d2 = readmatrix('10us.txt');
d3 = readmatrix('100us.txt');
d4 = readmatrix('10ms.txt');

t1 = d1(:,1)*1e3;   vc1 = d1(:,2);
t2 = d2(:,1)*1e3;   vc2 = d2(:,2);
t3 = d3(:,1)*1e3;   vc3 = d3(:,2);
t4 = d4(:,1)*1e3;   vc4 = d4(:,2);


plot(t1, vc1, '-',  'LineWidth', 2); hold on;
plot(t2, vc2, '--', 'LineWidth', 2);
plot(t3, vc3, ':',  'LineWidth', 2.5);
plot(t4, vc4, '-.', 'LineWidth', 2, 'Marker', 'o', 'MarkerIndices', 1:1:length(t4));

grid on;
xlabel('Time (ms)', 'FontSize', 12);
ylabel('Capacitor Voltage, v_C(t) (V)', 'FontSize', 12);
title('Comparison of Capacitor Voltage for Different Maximum Timesteps', 'FontSize', 13);
legend('1 \mus', '10 \mus', '100 \mus', '10 ms', 'Location', 'southeast');
set(gca, 'FontSize', 11, 'LineWidth', 1.2);

xlim([0 60]);
ylim([0 7]);
