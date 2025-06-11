% Scenario 2/6: Synthetic ECG/PPG
fs = 250; t = linspace(0, 10, fs*10);
normal_ecg = 0.6*sin(2*pi*1.0*t) + 0.05*randn(1, length(t));
arrhythmia_ecg = 0.6*sin(2*pi*1.3*t + sin(t*0.5)) + 0.1*randn(1, length(t));
ppg = 0.4*sin(2*pi*1.2*t) + 0.02*randn(1, length(t));
T = table(t', normal_ecg', arrhythmia_ecg', ppg', 'VariableNames', ...
    {'Time', 'Normal_ECG', 'Arrhythmia_ECG', 'PPG'});
writetable(T, 'synthetic_ecg_ppg_signals.csv');

% Scenario 1: Latency Bar Chart
figure;
bar([5.2, 6.3, 8.1]);
hold on;
errorbar(1:3, [5.2, 6.3, 8.1], [0.3, 0.5, 0.7], '.k');
set(gca, 'XTickLabel', {'Sitting', 'Walking', 'Running'});
ylabel('Latency (ms)');
title('Latency Under Different Postures');
grid on;
saveas(gcf, 'posture_latency_bar.png');

% Scenario 3: QoE Surface Plot
[delay, energy] = meshgrid(linspace(10,100,10), linspace(100,500,10));
QoE = 100 - 0.5 * delay - 0.2 * energy / 10;
figure;
surf(delay, energy, QoE);
xlabel('Delay (ms)'); ylabel('Energy (μJ)'); zlabel('QoE Utility');
title('QoE Adaptation Surface');
saveas(gcf, 'qoe_surface_plot.png');

% Scenario 7: Energy vs Duty Cycle
figure;
bar([70, 92, 120]);
set(gca, 'XTickLabel', {'25%', '50%', '75%'});
xlabel('Duty Cycle'); ylabel('Energy (μJ/packet)');
title('Energy Usage vs. Duty Cycle');
grid on;
saveas(gcf, 'energy_duty_bar.png');
