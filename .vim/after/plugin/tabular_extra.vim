AddTabularPipeline! collapse_spaces / / map(a:lines, "substitute(v:val, '  *', ' ', 'g')") | tabular#TabularizeStrings(a:lines, ' ', 'l0')

