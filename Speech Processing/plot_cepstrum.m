function plot_cepstrum(signal,sampling_frequency,gender)

    switch gender
        case 'm'
            plot_cepstrum_male(signal,sampling_frequency);
        case 'f'
            plot_cepstrum_female(signal,sampling_frequency);
        otherwise
            error('Must select gender, Male (''m'') or Female (''f'')');
    end
    
end

function plot_cepstrum_male(signal,sampling_frequency)

    sampling_period = 1/sampling_frequency;

    cepstrum = cceps(signal);

    time = 0:sampling_period:length(signal)*sampling_period-sampling_period;
    % a vector of 'times' incresing in increments equal to the sampling period
    % and with the same length as the original signal (converted from #samples
    % to time) and one unit of time period taken off. (Need to keep vectors
    % same length)


    time_region = time(time>=5e-3 & time<=12e-3);
    cepstrum_region = cepstrum(time>=5e-3 & time<=12e-3);

    [~,index_max_val] = max(cepstrum_region);  %returns index of max value, rather then actual value.

    figure('Name', 'Cepstrum Plot')
    plot(time_region*1e3,cepstrum_region) %*1e3 to convert from seconds to milliseconds
    xlabel('ms')

    hold on
    plot(time_region(index_max_val)*1e3,cepstrum_region(index_max_val),'o')
    hold off
    
end

function plot_cepstrum_female(signal,sampling_frequency)

    sampling_period = 1/sampling_frequency;

    cepstrum = cceps(signal);

    time = 0:sampling_period:length(signal)*sampling_period-sampling_period;
    % a vector of 'times' incresing in increments equal to the sampling period
    % and with the same length as the original signal (converted from #samples
    % to time) and one unit of time period taken off. (Need to keep vectors
    % same length)


    time_region = time(time>=2e-3 & time<=10e-3);
    cepstrum_region = cepstrum(time>=2e-3 & time<=10e-3);

    [~,index_max_val] = max(cepstrum_region);  %returns index of max value, rather then actual value.

    figure('Name', 'Cepstrum Plot')
    plot(time_region*1e3,cepstrum_region) %*1e3 to convert from seconds to milliseconds
    xlabel('ms')

    hold on
    plot(time_region(index_max_val)*1e3,cepstrum_region(index_max_val),'o')
    hold off
    
end

