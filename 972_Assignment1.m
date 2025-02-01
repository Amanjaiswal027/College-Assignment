x1_samples = input('Enter the samples of x1[n]: ');
x1_zero_index = input('Enter the position of n=0 for x1[n] (index): ');

x2_samples = input('Enter the samples of x2[n]: ');
x2_zero_index = input('Enter the position of n=0 for x2[n] (index): ');

x1_n_values = (1:length(x1_samples)) - x1_zero_index;
x2_n_values = (1:length(x2_samples)) - x2_zero_index;

common_n_range = min(min(x1_n_values), min(x2_n_values)) : max(max(x1_n_values), max(x2_n_values));

x1_aligned = zeros(1, length(common_n_range));
x2_aligned = zeros(1, length(common_n_range));

x1_aligned(ismember(common_n_range, x1_n_values)) = x1_samples;
x2_aligned(ismember(common_n_range, x2_n_values)) = x2_samples;

figure;
subplot(3, 2, 1);
stem(x1_n_values, x1_samples, 'r', 'LineWidth', 1.5); grid on;
xlabel('n'); ylabel('x1[n]');
title('Sequence x1[n]');

subplot(3, 2, 2);
stem(x2_n_values, x2_samples, 'b', 'LineWidth', 1.5); grid on;
xlabel('n'); ylabel('x2[n]');
title('Sequence x2[n]');

% Operations
sum_sequence = x1_aligned + x2_aligned;
difference_sequence = x1_aligned - x2_aligned;
product_sequence = x1_aligned .* x2_aligned;

% Plot sum_sequence[n]
subplot(3, 2, 3);
stem(common_n_range, sum_sequence, 'm', 'LineWidth', 1.5); grid on;
xlabel('n'); ylabel('Sum');
title('Sum: x1[n] + x2[n]');

% Plot difference_sequence[n]
subplot(3, 2, 4);
stem(common_n_range, difference_sequence, 'g', 'LineWidth', 1.5); grid on;
xlabel('n'); ylabel('Difference');
title('Difference: x1[n] - x2[n]');

% Plot product_sequence[n]
subplot(3, 2, 5);
stem(common_n_range, product_sequence, 'k', 'LineWidth', 1.5); grid on;
xlabel('n'); ylabel('Product');
title('Product: x1[n] .* x2[n]');
