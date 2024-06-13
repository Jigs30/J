% Read time series data from Excel sheet
data=xlsread('C:\PU\Research\Shakeer sir\Hombegowda Nagar, Bengaluru - KSPCB reads upto 2023-05-03.xlsx',2,'B2:O97');
time = data(:, 1); % Assuming the first column contains time data
signal = data(:, 2); % Assuming the second column contains the time series signal

% Sample rate
Fs = 1 / (time(2) - time(1)); % Sampling frequency (assuming time is evenly spaced)

% Spectrogram parameters
window = 128; % Window size for FFT% Read the data from the spreadsheet
data = readmatrix('data.xlsx', 'Sheet', 'Sheet2');

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
overlap = window / 2; % Overlap between adjacent windows

% Compute spectrogram
[S, F, T] = spectrogram(signal, window, overlap, [], Fs);

% Plot and save spectrogram images
for i = 1:size(S, 2)
    % Plot spectrogram
    figure;
    surf(T, F, 10 * log10(abs(S(:, i))), 'EdgeColor', 'none');
    axis xy; axis tight; colormap(jet); view(0,90);
    xlabel('Time (s)'); ylabel('Frequency (Hz)');
    title(['Spectrogram at time index ', num2str(i)]);
    colorbar;
    
    % Save spectrogram image
    filename = ['spectrogram_', num2str(i), '.png'];
    saveas(gcf, filename);
    close(gcf); % Close the figure to prevent accumulation
end
