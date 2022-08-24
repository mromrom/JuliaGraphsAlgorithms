suite["boruvka"] = BenchmarkGroup()
suite["boruvka"]["wgraphs"] = BenchmarkGroup()
for (name,g) in WGRAPHS
    suite["boruvka"]["wgraphs"][name] = @benchmarkable boruvka_algorithm($g)
end
