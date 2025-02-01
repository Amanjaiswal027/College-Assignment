%------------------------------------------- Question 1 ------------------------------------

x_samples = input('Enter the samples of x[n] as a vector (e.g., [1 2 3 4]): ');
n_zero_index = input('Enter the position of n=0 for x[n] (index): ');
time_shift = input('Enter the time delay/advance (positive for delay, negative for advance): ');

n_original = (1:length(x_samples)) - n_zero_index;
n_shifted = n_original - time_shift;

figure;

subplot(2,1,1);
stem(n_original, x_samples, 'r', 'LineWidth', 1.5); grid on;
xlabel('TIME INDEX'); ylabel('x[n]');
title('Original Sequence x[n]');

subplot(2,1,2);
stem(n_shifted, x_samples, 'b', 'LineWidth', 1.5); grid on;
xlabel('TIME INDEX'); ylabel('y[n]');
title(['Shifted Sequence y[n]']);


% ----------------------------------------- Question 2 -----------------------------------------

% Input the first sequence and its time index reference
x_samples = input('Enter the samples of x[n] as a vector (e.g., [1 2 3 4]): ');
x_n0_index = input('Enter the position of n=0 for x[n] (index): ');

% Input the second sequence and its time index reference
h_samples = input('Enter the samples of h[n] as a vector (e.g., [1 2 3 4]): ');
h_n0_index = input('Enter the position of n=0 for h[n] (index): ');

% Define time indices for both sequences
x_time_indices = (0:length(x_samples)-1) - x_n0_index;
h_time_indices = (0:length(h_samples)-1) - h_n0_index;

% Define time indices for the convolution result
conv_time_indices = (0:(length(x_samples) + length(h_samples) - 2)) - (x_n0_index + h_n0_index);
conv_result = zeros(1, length(conv_time_indices));

% Perform manual convolution
for x_index = 1:length(x_samples)
    for h_index = 1:length(h_samples)
        conv_result(x_index + h_index - 1) = conv_result(x_index + h_index - 1) + x_samples(x_index) * h_samples(h_index);
    end
end

% Plot the original sequences and the convolution result
figure;

subplot(3,1,1);
stem(x_time_indices, x_samples, 'r', 'LineWidth', 1.5); grid on;
xlabel('TIME INDEX'); ylabel('x[n]');
title('Original Sequence x[n]');

subplot(3,1,2);
stem(h_time_indices, h_samples, 'r', 'LineWidth', 1.5); grid on;
xlabel('TIME INDEX'); ylabel('h[n]');
title('Original Sequence h[n]');

subplot(3,1,3);
stem(conv_time_indices, conv_result, 'r', 'LineWidth', 1.5); grid on;
xlabel('TIME INDEX'); ylabel('y[n]');
title('Convoluted Sequence y[n] (Manual Calculation)');
