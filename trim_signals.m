function output = trim_signals(input, offset)
    % Trim signals according to offsets
    N = length(offset);
    output = cell(size(input));
    frame_index = floor(offset/N);
%     display(frame_index);
    trim_index = max(frame_index) - frame_index;
%     display(trim_index);
    for i=1:N
        output{i} = input{i}((trim_index(i)+1):end);
    end
    
    % trim end so all signals have same length
    % required by non-uniform reconstruction algorithm
    minlen = min(cellfun('length', output));
    for i = 1:N
       output{i} = output{i}(1:minlen); 
    end
end