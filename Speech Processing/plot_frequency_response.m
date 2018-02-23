function plot_frequency_response(lpc_coefficients)

    figure('Name', 'Frequency Response')
    freqz(1,lpc_coefficients,3600);
end

