% Wong Jin Tim
% Student ID: 20612520
% Task VII - Error and Accuracy in Numerical Techniques

clear; clc; close all;

intervals = [100 1000 10000];

trap_ER_10 = [0.798218 0.078316 0.007738];
trap_EC_10 = [0.002794 0.001392 0.0000104];
trap_ER_60 = [3.060891 0.309121 0.029626];
trap_EC_60 = [0.018164 0.000735 0.000735];

simp_ER_10 = [0.533549 0.053614 0.004209];
simp_EC_10 = [0.0000104 0.0000104 0.0000104];
simp_ER_60 = [2.061073 0.204594 0.020537];
simp_EC_60 = [0.000735 0.000735 0.000735];

figure;
semilogx(intervals, trap_ER_10, '-o', intervals, simp_ER_10, '-s', ...
         intervals, trap_ER_60, '--o', intervals, simp_ER_60, '--s', ...
         'LineWidth', 1.5);
grid on;
xlabel('Number of intervals');
ylabel('Percentage error (%)');
title('Error versus intervals for E_R(t)');
legend('Trapezoidal, 10 ms', 'Simpson, 10 ms', ...
       'Trapezoidal, 60 ms', 'Simpson, 60 ms', 'Location', 'best');

figure;
semilogx(intervals, trap_EC_10, '-o', intervals, simp_EC_10, '-s', ...
         intervals, trap_EC_60, '--o', intervals, simp_EC_60, '--s', ...
         'LineWidth', 1.5);
grid on;
xlabel('Number of intervals');
ylabel('Percentage error (%)');
title('Error versus intervals for E_C(t)');
legend('Trapezoidal, 10 ms', 'Simpson, 10 ms', ...
       'Trapezoidal, 60 ms', 'Simpson, 60 ms', 'Location', 'best');
