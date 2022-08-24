suite["kahn"] = BenchmarkGroup()
suite["kahn"]["digraphs"] = BenchmarkGroup()
for (name,g) in DIGRAPHS
    suite["kahn"]["digraphs"][name] = @benchmark topological_sort_by_kahn($g)
end
