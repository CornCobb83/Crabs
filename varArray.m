function stacked_vars = varArray(vars, x)
    num_vars = length(vars);
    stacked_vars = cell(x * num_vars, 1);

    for i = 1:x
        for j = 1:num_vars
            stacked_vars{(i - 1) * num_vars + j} = [vars{j}, num2str(i)];
        endfor
    endfor
endfunction
