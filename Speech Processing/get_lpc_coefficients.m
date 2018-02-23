function lpc_coefficients = get_lpc_coefficients(signal,order)
    
    signal_length = length(signal);
    windowed_signal = signal.*hamming(signal_length);

    preemp = [1 0.63];
    windowed_signal_filtered =  filter(1,preemp,windowed_signal);

    lpc_coefficients = lpc(windowed_signal_filtered,order);
    
end

