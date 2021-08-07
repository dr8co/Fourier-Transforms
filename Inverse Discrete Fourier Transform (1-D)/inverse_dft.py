"""Computation of one-dimensional inverse discrete fourier transform (DFT)"""
import matplotlib.pyplot as plt
import numpy as np


def fourier_transform():
    """Compute the one-dimensional inverse DFT of a wave"""
    pi = np.pi
    signal_length = 0.5  # Duration in seconds
    sample_rate = 900  # Hz

    dt = 1 / sample_rate  # time between two samples
    df = 1 / signal_length  # frequency between points

    t = np.arange(0, signal_length, dt)  # Create time points
    n_t = len(t)

    # creating two sine waves:
    sin_wave1 = np.sin(2 * pi * 50 * t)
    sin_wave2 = np.sin(2 * pi * 70 * t + pi / 4)

    y = sin_wave1 + sin_wave2  # Adding the two sine waves
    f = np.fft.ifft(y)  # compute the inverse fourier transform of y

    freq = df * np.arange(0, (n_t - 1) / 2, dtype='d')  # d option for double precision float
    n_f = len(freq)

    # plotting the input data vs time:
    plt.subplot(2, 1, 1)
    plt.plot(t, y, label='input data')
    plt.xlabel('time [s]')
    plt.ylabel('signal')

    # plotting the frequency spectrum:
    plt.subplot(2, 1, 2)
    plt.plot(freq, abs(f[0:n_f]), label='abs Fourier Transform')
    plt.xlabel('frequency [Hz]')
    plt.ylabel('abs(DFT(signal))')

    plt.show()


if __name__ == '__main__':
    fourier_transform()
