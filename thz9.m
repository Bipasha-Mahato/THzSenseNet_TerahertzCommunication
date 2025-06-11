% Data definition
methods = {'THzSenseNet', 'Alekseeva (2024)', 'Al-Quraan (2024)', ...
           'Barakabitze (2022)', 'Huang et al. (2024)'};

accuracy = [96.8, 91.0, 89.5, 87.2, 85.5];
energy = [70, 120, 110, 105, 125];
latency = [5.2, 7.8, 6.9, 8.1, 7.5];
qoe = [92.5, 68.4, 72.3, 75.5, 70.1];

% Create table
T = table(methods', accuracy', energy', latency', qoe', ...
    'VariableNames', {'Method', 'Accuracy', 'Energy', 'Latency', 'QoE'});

% Save CSV
writetable(T, 'comparative_analysis_results.csv');

% Generate bar plots
figure;
subplot(2,2,1);
bar(accuracy); title('Accuracy (%)');
set(gca, 'XTickLabel', methods); xtickangle(30);

subplot(2,2,2);
bar(energy); title('Energy (µJ)');
set(gca, 'XTickLabel', methods); xtickangle(30);

subplot(2,2,3);
bar(latency); title('Latency (ms)');
set(gca, 'XTickLabel', methods); xtickangle(30);

subplot(2,2,4);
bar(qoe); title('QoE Utility');
set(gca, 'XTickLabel', methods); xtickangle(30);

% Save figure
saveas(gcf, 'comparative_analysis_charts.png');
