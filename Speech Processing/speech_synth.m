

[signal,sampling_frequency] = signal_setup('had_f.wav'); %Note, ensure the
 %correct gender is selected for the fundamental frequency funciton. 


lpc_coefficients = get_lpc_coefficients(signal,21);

formants = get_formants(lpc_coefficients,sampling_frequency);
disp('Formants: ');
disp(formants(1:3));

%Note ensure the correct gender is selected for the fundamental freqeuncy
%and plot ceptrum functions. 
fundamental_frequency = get_fundamental_frequency(signal, sampling_frequency,'f');
disp('Fundamental Frequency: ');
disp(fundamental_frequency);
plot_cepstrum(signal,sampling_frequency,'f');

synthed_signal = get_synthed_signal(fundamental_frequency,sampling_frequency,...
    lpc_coefficients);


plot_frequency_response(lpc_coefficients);
plot_amplitude_response(synthed_signal,sampling_frequency);


playable = audioplayer(synthed_signal, sampling_frequency);
%play(playable);

%The following line is used to write audio samples to file. It is not in
%general necessary to the program's operation.
%audiowrite('50 to 150 order 21.wav',synthed_signal,sampling_frequency);

%**** PLOT SPECTROGRAM OF SYNTHESISED SIGNAL ****%
figure('Name', 'Synthed Spectrogram')
spectrogram(synthed_signal,100,95,[],sampling_frequency,'yaxis')
title('Signal Spectrogram')
