function formants = get_formants(lpc_coefficients,sampling_frequency)

    rts = roots(lpc_coefficients);
    positive_rts = rts(imag(rts)>=0);
    
    angles = atan2(imag(positive_rts),real(positive_rts));

    [freq,indicies] = sort(angles.*(sampling_frequency/(2*pi)));
    bandwidth = -1/2*(sampling_frequency/(2*pi))*log(abs(rts(indicies)));
    
    formants_temp = double.empty(5,0); 
    for i = 1:length(freq)
        if (freq(i) > 90 && bandwidth(i) < 400)
            
            formants_temp(i) = freq(i);
            
        end
    end
    formants_temp(formants_temp == 0) = [];
    
    formants = formants_temp;
end

