 data= xlsread('C:\PU\Research\Shakeer sir\Hombegowda Nagar, Bengaluru - KSPCB reads upto 2023-05-03.xlsx',2,'A54:O54');

[s,f,t] = spectrogram(data);

waterplot(s,f,t);