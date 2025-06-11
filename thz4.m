% figure2_latency_motion.m

nodes = categorical({'Node A', 'Node B', 'Node C', 'Node D', 'Node E'});
nodes = reordercats(nodes, {'Node A', 'Node B', 'Node C', 'Node D', 'Node E'});

mean_latency = [5.6, 6.1, 5.2, 6.4, 5.8]; % in milliseconds
std_latency = [0.4, 0.5, 0.3, 0.6, 0.5];

figure;
bar(nodes, mean_latency, 'FaceColor', [0.6 0.8 1]);
hold on;
errorbar(nodes, mean_latency, std_latency, 'k.', 'LineWidth', 1.5);
ylabel('Latency (ms)');
title('Simulated Latency Under Dynamic Body Motion (Mean ± Std)');
grid on;
set(gca, 'FontSize', 12);
saveas(gcf, 'figure2_latency_motion.png');
