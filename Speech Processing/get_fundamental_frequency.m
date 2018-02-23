function fundamental_frequency = get_fundamental_frequency...
    (signal,sampling_frequency,gender)

    switch gender
        case 'm'
            fundamental_frequency = get_fundamental_frequency_male(signal,...
                sampling_frequency);
        case 'f'
            fundamental_frequency = get_fundamental_frequency_female(signal,...
                sampling_frequency);
        otherwise
            error('Must select gender, Male (''m'') or Female (''f'')');
    end
end


function fundamental_frequency = get_fundamental_frequency_male...
    (signal,sampling_frequency)


    sampling_period = 1/sampling_frequency;

    cepstrum = cceps(signal);

    time = 0:sampling_period:length(signal)*sampling_period-sampling_period;
    % a vector of 'times' incresing in increments equal to the sampling period
    % and with the same length as the original signal (converted from #samples
    % to time) and one unit of time period taken off. (Need to keep vectors
    % same length)


    time_region = time(time>=5e-3 & time<=12e-3);    
    cepstrum_region = cepstrum(time>=5e-3 & time<=12e-3);
     %Female: 2-10, Male: 5-12
     % We are using the times to select a frequency range. 1/0.01 -> 100Hz,
     % 1/0.002 -> 500Hz. Men have a lower freqeuncy band, i.e. 1/0.012 ->
     % ~80Hz and 1/0.005 -> 200Hz

    [~,index_max_val] = max(cepstrum_region);  %returns index of max value, rather then actual value.

    fundamental_frequency = 1/time_region(index_max_val);
end

function fundamental_frequency = get_fundamental_frequency_female...
    (signal,sampling_frequency)


    sampling_period = 1/sampling_frequency;

    cepstrum = cceps(signal);

    time = 0:sampling_period:length(signal)*sampling_period-sampling_period;
    % a vector of 'times' incresing in increments equal to the sampling period
    % and with the same length as the original signal (converted from #samples
    % to time) and one unit of time period taken off. (Need to keep vectors
    % same length)


    time_region = time(time>=2e-3 & time<=10e-3);    
    cepstrum_region = cepstrum(time>=2e-3 & time<=10e-3);
     %Female: 2-10, Male: 5-12
     % We are using the times to select a frequency range. 1/0.01 -> 100Hz,
     % 1/0.002 -> 500Hz. Men have a lower freqeuncy band, i.e. 1/0.012 ->
     % ~80Hz and 1/0.005 -> 200Hz

    [~,index_max_val] = max(cepstrum_region);  %returns index of max value, rather then actual value.

    fundamental_frequency = 1/time_region(index_max_val);
end

