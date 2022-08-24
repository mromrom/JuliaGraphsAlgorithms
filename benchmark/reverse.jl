suite["reverse"] = BenchmarkGroup()
suite["reverse"]["wgraphs"] = BenchmarkGroup()
for (name,g) in WGRAPHS
    suite["reverse"]["wgraphs"][name] = @benchmark reverse_delete_algorithm($g)
end
