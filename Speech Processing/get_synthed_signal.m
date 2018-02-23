function synthed_signal = get_synthed_signal(...
    fundamental_frequency,sampling_frequency,lpc_coefficients)

    T = 1/fundamental_frequency;
    impulse_period = floor(T*sampling_frequency);

    impulse_train = zeros(1,sampling_frequency);
    impulse_train(1 : impulse_period : end) = 1;

    synthed_signal = filter(1,lpc_coefficients,impulse_train);
end

