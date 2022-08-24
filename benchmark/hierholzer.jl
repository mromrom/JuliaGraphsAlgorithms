suite["hierholzer"] = BenchmarkGroup()
suite["hierholzer"]["digraphs"] = BenchmarkGroup()
for (name,g) in DIGRAPHS
    suite["hierholzer"]["digraphs"][name] = @benchmark hierholzer_algorithm($g)
end
