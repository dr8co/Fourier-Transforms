%This is an implementation of the Fourier Transform in MATLAB.
%The results are similar to those obtained in the python implementation.

signalLength = 0.5; % Duration in seconds
sampleRate = 900; % in Hz

dt = 1 / sampleRate; % time interval between two samples
df = 1 / signalLength; % frequency between points

t = 0:dt:signalLength; % time points
[~, n_t] = size(t);

% creating two sine waves:
sin_wave1 = sin(2*pi*50*t);
sin_wave2 = sin(2*pi*70*t + pi/4);

y = sin_wave1 + sin_wave2; % y as a function of the sum of the two waves
f = fft(y); % compute Fourier Transform of y

k = 0:2:(n_t);
freq = df.*k;
[~, n_f] = size(freq);
p = abs(f);

% Plotting the input data vs time:
subplot(2,1,1)
plot(t,y)
title('Input data vs Time')
xlabel('time (s)')
ylabel('signal')

% Plotting the frequency spectrum:
subplot(2,1,2)
plot(freq, p(1:n_f))
title('frequency spectrum')
xlabel('frequency (Hz)')
ylabel('abs(DFT(signal))')
