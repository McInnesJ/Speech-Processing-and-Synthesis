function [signal_segment,sampling_frequency] = signal_setup(input_file)

    [full_signal,sampling_frequency] = audioread(input_file);
    
    segmentlength = 100;
    noverlap = 95;
    
    figure('Name', 'Signal Spectrogram')
    spectrogram(full_signal,segmentlength,noverlap,[],sampling_frequency,'yaxis')
    title('Signal Spectrogram')
    
    
    Istart = 0.05*sampling_frequency;        
    Iend =  0.15*sampling_frequency;        
    
    signal_segment = full_signal(Istart:Iend);
end

