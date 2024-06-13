% Read the data from the spreadsheet
data = readmatrix('C:\PU\Research\Shakeer sir\Hombegowda Nagar, Bengaluru - KSPCB reads upto 2023-05-03.xlsx',2,'B2:O97');
% Reshape the data into a matrix where each row is a signal
signals = data';

% Number of signals
num_signals = size(signals, 1);

% Loop through each signal and compute the spectrogram
for i = 1:num_signals
    signal = signals(i, :);
    
    % Compute the spectrogram
    [~, F, T, P] = spectrogram(signal, hamming(256), 128, 256, 8000);
    
    % Convert the spectrogram to a decibel scale
    P_dB = 20 * log10(abs(P));
    
    % Save the spectrogram as an image
    filename = sprintf('spectrogram_%d.png', i);
    imagesc(T, F, P_dB);
    axis xy;
    xlabel('Time (s)');
    ylabel('Frequency (Hz)');
    colormap(jet);
    set(gca, 'FontSize', 14);
    print(filename, '-dpng', '-r300');
end