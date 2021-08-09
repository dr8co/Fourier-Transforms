{# Implementation of the fast Fourier Transform algorithm in R.

signalLength = 0.5;  # Duration in seconds
sampleRate = 900;  #in Hz

dt <- 1 / sampleRate;  # time interval between two points
df <- 1 / signalLength;  # Frequency between points

t <- seq(from = 0, to = signalLength, by = dt); # time points
n_t = length(t);

# Creating two sine waves:
sin_wave1 <- sin(2 * pi * 50 * t);
sin_wave2 <- sin(2 * pi * 70 * t + pi / 4);

y <- sin_wave1 + sin_wave2; # y as the sum of the two waves
f <- fft(y, inverse = FALSE); # computing the Fourier Transform
freq <- df*seq(from = 0, to = (n_t - 1) / 2);
n_f = length(freq);

# Plotting the input data vs time:
par(mfrow=c(2, 1));
plot(t,y, main = "Input Data",
     ylab = "signal",
     xlab = "time (s)",
     type = "l",
     col = "blue");

# Plotting the frequency spectrum:
plot(freq, abs(f[0:n_f]), main = "The Frequency Spectrum", 
     ylab = "abs(DFT(signal))",
     xlab = "Frequency (Hz)",
     type = "l",
     col = "blue");
}
