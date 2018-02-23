function plot_amplitude_response(signal,sampling_frequency)

    signal_length = length(signal); 
    
    fourier_transform = fft(signal);
    real_F_T = abs(fourier_transform);
    single_sided = real_F_T(1:(signal_length/2)+1);

    frequency = sampling_frequency*((0:signal_length/2)/signal_length);

    figure('Name', 'Amplitude Spectrum')
    plot(frequency,single_sided)
    xlabel('Frequency (Hz)')
    ylabel('Amplitude')
end

