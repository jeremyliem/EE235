% TIMESCALE Perform a time shift operation on x (sampled at Fs) by
% factor "to".
% USAGE: [y1, t1] = timeshift(signal, signal_Fs, 2);
% AUTHOR: Jeremy Liem
function [y, t] = timeshift(x, Fs, to)

    % Perform time shifting operation and produce sound vector y
    if to >= 0          % Time shift right
        %Calculate number of zeroes and round up using ceil function
        nz = ceil(to * Fs); 
        %Initialize column vector
        y = zeros(nz + length(x), 1);
        
        %Determine index of to seconds
        index_to = ceil(to*Fs + 1);
        %storing in variable
        y(index_to:end) = x;
        
    else                % Time shift left
        
        %Determine Starting Index. 
        start_index = ceil(-to*Fs + 1);
        %Extract samples from x using the new starting index.
        y = x(start_index:end);
        
      
        
    end
    
    % Compute the corresponding time samples vector t for sound vector y
        t = (0:length(y)-1)*(1/Fs);
    
end