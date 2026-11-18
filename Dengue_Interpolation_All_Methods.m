%% Dengue Cases in Kandy District (2014-2023)
% Combined MATLAB script based on Study-Report.docx.
% Original reported values and calculations preserved; not independently validated.
% Run the whole file or run individual sections using MATLAB Editor.

%% Newton Divided Differences
clearvars; close all; clc;

% Extracted from the original Study-Report.docx; values preserved as reported.
% Define the data
years = [2014:2023];
predicted_values = [2336,3528,4063,4100,3832,3516,3443,3967,5478,8427];
actual_values = [2336,1325,4063,14408,3832,8940,3443,1020,5478,1121];

% Plot the predicted values
figure;
plot(years, predicted_values, '-o', 'DisplayName', 'Predicted Values', 'LineWidth', 2, 'MarkerSize', 8);
hold on;

% Plot the actual values
plot(years, actual_values, '-s', 'DisplayName', 'Actual Values', 'LineWidth', 2, 'MarkerSize', 8);

% Add labels and title
xlabel('Years');
ylabel('Dengue Cases');
title('Newton s Interpolation Polynomial');
legend('show');

% Display the grid
grid on;
hold off;

%% Lagrange Interpolation
clearvars; close all; clc;

% Extracted from the original Study-Report.docx; values preserved as reported.
% Define the data
years = [2014:2023];
predicted_values = [2336,3528,4063,4100,3832,3516,3443,3967,5478,8427];
actual_values = [2336,1325,4063,14408,3832,8940,3443,1020,5478,1121];

% Plot the predicted values
figure;
plot(years, predicted_values, '-o', 'DisplayName', 'Predicted Values', 'LineWidth', 2, 'MarkerSize', 8);
hold on;

% Plot the actual values
plot(years, actual_values, '-s', 'DisplayName', 'Actual Values', 'LineWidth', 2, 'MarkerSize', 8);

% Add labels and title
xlabel('Years');
ylabel('Dengue Cases');
title('Lagrange Interpolation Polynomial');
legend('show');

% Display the grid
grid on;
hold off;

%% Cubic Spline Coefficients
clearvars; close all; clc;

% Extracted from the original Study-Report.docx; values preserved as reported.
x = [2014, 2016, 2018, 2020, 2022];
y = [2336,4063,3832,3443,5478];

% Number of intervals
n = length(x) - 1;

% Calculate h values (differences between consecutive x values)
h = diff(x);

% Set up the system of equations
A = zeros(n+1);
b = zeros(n+1, 1);

% Interior points
for i = 2:n
A(i, i-1:i+1) = [h(i-1) 2*(h(i-1) + h(i)) h(i)];
b(i) = 3*((y(i+1) - y(i))/h(i) - (y(i) - y(i-1))/h(i-1));
end

% Natural spline boundary conditions
A(1, 1) = 1;
A(end, end) = 1;

% Solve for c coefficients
c = A\b;

% Solve for b and d coefficients
b = zeros(n, 1);
d = zeros(n, 1);

for i = 1:n
b(i) = (y(i+1) - y(i))/h(i) - h(i)*(2*c(i) + c(i+1))/3;
d(i) = (c(i+1) - c(i)) / (3*h(i));
end

% Solve for a coefficients
a = y(1:end-1);

% Display the polynomial coefficients for each interval

disp('Natural Cubic Spline Polynomials for Each Interval:') ;
for i = 1:n
fprintf('Interval [%d, %d]:\n', x(i), x(i+1));
fprintf('s(x) = %.4f * (x - %d)^3 + %.4f * (x - %d)^2 + %.4f * (x - %d) + %.4f\n', ...
d(i), x(i), c(i), x(i), b(i), x(i), a(i));
fprintf('\n');
end

%% Cubic Spline Plot
clearvars; close all; clc;

% Extracted from the original Study-Report.docx; values preserved as reported.
% Given data points
x_actual = 2014:2023;
y_actual = [2336, 1325, 4068, 14408, 3832, 8940, 3443, 1020, 5478, 1121];

% Predict data points for cubic spline
y_cubic_predict = [2336, 3376, 4063, 4154, 3832, 3433, 3443, 4226, 5478,1121];

% Generate points for interpolation
x_interp = linspace(min(x_actual), max(x_actual), 500);
y_interp = spline(x_actual, y_actual, x_interp);

% Plotting figure
figure;
plot(x_actual, y_actual, 'ro', 'MarkerSize', 10, 'LineWidth', 2, 'DisplayName', 'Actual Data Points');
hold on;
plot(x_interp, y_interp, 'b-', 'LineWidth', 1.5, 'DisplayName', 'Cubic Spline Interpolation');

% Add predicted points for reference (if needed)
plot(x_actual, y_cubic_predict, 'gx-', 'LineWidth', 1.5, 'DisplayName', 'Cubic Spline Predicted');

% Add title and labels
title('Cubic Spline Interpolation');
xlabel('Year');
ylabel('Dengue Cases');
legend('show');
grid on;
hold off;

%% Least Squares Approximation
clearvars; close all; clc;

% Extracted from the original Study-Report.docx; values preserved as reported.
% Define the data
years = [2014:2023];
predicted_values = [5275,5125,4974,4823,4672,4522,4371,4220,4070,3919];
actual_values = [2336,1325,4063,14408,3832,8940,3443,1020,5478,1121];

% Plot the predicted values
figure;
plot(years, predicted_values, '-o', 'DisplayName', 'Predicted Values', 'LineWidth', 2, 'MarkerSize', 8);
hold on;

% Plot the actual values
plot(years, actual_values, '-s', 'DisplayName', 'Actual Values', 'LineWidth', 2, 'MarkerSize', 8);

% Add labels and title
xlabel('Years');
ylabel('Dengue Cases');
title('Least Square Approximation');
legend('show');

% Display the grid
grid on;
hold off;

%% Comparison of All Methods
clearvars; close all; clc;

% Extracted from the original Study-Report.docx; values preserved as reported.
years_range =2014:2023;

actual=[2336,1325,4068,14408,3832,8940,3443,1020,5478,1121];
newton=[2336,3528,4063,4100,3832,3516,3443,3967,5478,8427];
lagrange = [2336,3528,4063,4100,3832,3516,3443,3967,5478,8427];
cubic = [2336,3376,4063,4154,3832,3433,3443,4226,5478,1121];
leastsquare = [5275,5125,4974,4823,4672,4522,4371,4220,4070,3919];
figure;

plot(years_range,actual, 'o-','DisplayName','actual_values');
hold on;
plot(years_range, newton, 'o--', 'LineWidth', 2, 'DisplayName', ' predicted newton values');
hold on;
plot(years_range, lagrange, '*-', 'LineWidth', 1, 'DisplayName', ' predicted lagrange values');
hold on;
plot(years_range, cubic, '-', 'LineWidth', 2, 'DisplayName', ' predicted cubic values');
hold on;
plot(years_range,leastsquare, '-o', 'DisplayName', 'Predicted least square Values', 'LineWidth', 2, 'MarkerSize' ,8 );


xlabel('years');
ylabel('No of dengue cases');
title('Actual values & predicted values of All polynomials');
legend('show');
