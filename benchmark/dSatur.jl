suite["dSatur"] = BenchmarkGroup()
suite["dSatur"]["graphs"] = BenchmarkGroup()
for (name,g) in GRAPHS
    suite["dSatur"]["graphs"][name] = @benchmark dSatur_algorithm($g)
end
