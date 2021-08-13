#=
Implementation and visualization of one dimensional DFT
using the fft algorithm in Julia.
Libraries used: FFTW & Plots
install the libraries using REPL by these commands:
    ] add FFTW
    ] add Plots
=#

using FFTW
using Plots

signal_length = 0.5  # Duration in seconds
sample_rate = 900  # in Hz

dt = 1 / sample_rate  # Time between two samples
df = 1 / signal_length  # frequency between points

# Creating time points:
t = 0:dt:signal_length
n_t = length(t)

# Creating two sine waves:
sin_wave1 = sin.(2*pi*50*t)
sin_wave2 = sin.(2*pi*70*t .+ pi / 4)

y = sin_wave1 .+ sin_wave2  # The signal to be transformed
f = fft(y)  # Compute the Fourier Transform of the signal

freq = df .* 0:((n_t-1)/2)
n_f = length(freq)

# Plotting the input data vs time:
time_domain = plot(t, y, title = "Input Data")
xlabel!("time (s)")
ylabel!("signal")

# Plotting the Frequency Spectrum
freq_domain = plot(freq, abs.(f[1:n_f]), title = "Frequency Spectrum")
xlabel!("frequency (Hz)")
ylabel!("abs(DFT(Signal)")
display(plot(time_domain, freq_domain, layout = (2,1)))
