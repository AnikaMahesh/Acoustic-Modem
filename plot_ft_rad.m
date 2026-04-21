%% FUNCTIONS
function [X, f] = plot_ft_rad(x, fs)
    % This function plots the magnitude of the Fourier transform of the signal x
    % which is assumed to originate from a Continous-time signal x(t) 
    % sampled with frequency fs.
    % The function returns X and f.
    % In other words, this function plots the FT of the DT signal x
    % with the frequency axis labeled as if it were the original CT signal.
    % 
    % X contains the frequency response X(w).
    % f contains the frequency samples.


    N = length(x);

    X = fftshift(fft(x));
    
    % Note that the frequency range here is from -fs/2*2*pi until
    % just a little bit less than fs/2*2*pi.
    % This is an artifact of the fact that we are actually computing a 
    % Discrete-Fourier-Transform (DFT) when we call FFT (which is a
    % numerical method to efficiently compute the DFT).
    
    f = linspace(-fs/2*2*pi, 2*pi*fs/2- 2*pi*fs/length(x), length(x));
    plot(f, abs(X));
    xlabel('Frequency (rad/s)');
    ylabel('|X(j\omega)|');
end