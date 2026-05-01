% Tim
% Student ID: 20612520
% Task VI - MATLAB Numerical Integration

clear; clc;

%% Import LTspice data
% Expected column order in your exported file:
% time    Vr    Vc    Ic
data = readmatrix('Task5.txt');

% Remove non-numeric rows if a header exists
data = data(~any(isnan(data),2), :);

t  = data(:,1);
vR = data(:,2);
vC = data(:,3);
iC = data(:,4);

%% Circuit parameters from student ID 20612520
R   = 1080;        % ohm
C   = 18e-6;       % F
Von = 7;           % V
tau = R*C;         % s

%% Time limits and interval counts
t_end_list = [10e-3, 60e-3];
N_list = [100, 1000, 10000];

%% Preallocate result arrays
trap_ER = zeros(length(N_list), length(t_end_list));
trap_EC = zeros(length(N_list), length(t_end_list));
simp_ER = zeros(length(N_list), length(t_end_list));
simp_EC = zeros(length(N_list), length(t_end_list));

%% Loop through each time limit and interval count
for j = 1:length(t_end_list)
    t_end = t_end_list(j);

    for k = 1:length(N_list)
        N = N_list(k);

        % Uniform grid for numerical integration
        tq = linspace(0, t_end, N+1)';

        % Interpolate LTspice data onto uniform grid
        vRq = interp1(t, vR, tq, 'linear');
        vCq = interp1(t, vC, tq, 'linear');
        iCq = interp1(t, iC, tq, 'linear');

        % Instantaneous powers
        pR = vRq .* iCq;
        pC = vCq .* iCq;

        % If your LTspice polarity makes powers negative, uncomment below:
        % pR = abs(pR);
        % pC = abs(pC);

        % Numerical integration
        trap_ER(k,j) = trapezoidal_rule(tq, pR);
        trap_EC(k,j) = trapezoidal_rule(tq, pC);

        simp_ER(k,j) = simpson_rule(tq, pR);
        simp_EC(k,j) = simpson_rule(tq, pC);
    end
end

%% Display results
Trap_Table = table(N_list', ...
    trap_ER(:,1), trap_EC(:,1), trap_ER(:,2), trap_EC(:,2), ...
    'VariableNames', {'Intervals','ER_10ms','EC_10ms','ER_60ms','EC_60ms'});

Simp_Table = table(N_list', ...
    simp_ER(:,1), simp_EC(:,1), simp_ER(:,2), simp_EC(:,2), ...
    'VariableNames', {'Intervals','ER_10ms','EC_10ms','ER_60ms','EC_60ms'});

disp('Trapezoidal Rule Results:');
disp(Trap_Table);

disp('Simpson''s Rule Results:');
disp(Simp_Table);

%% ---------- Local functions ----------
function I = trapezoidal_rule(x, y)
    h = x(2) - x(1);
    I = h * (0.5*y(1) + sum(y(2:end-1)) + 0.5*y(end));
end

function I = simpson_rule(x, y)
    n = length(x) - 1;

    if mod(n,2) ~= 0
        error('Simpson''s Rule requires an even number of intervals.');
    end

    h = x(2) - x(1);
    I = h/3 * ( y(1) + y(end) ...
        + 4*sum(y(2:2:end-1)) ...
        + 2*sum(y(3:2:end-2)) );
end