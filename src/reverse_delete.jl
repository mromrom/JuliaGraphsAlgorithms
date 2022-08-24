function reverse_delete_algorithm(initial_graph)
    edges_initial_graph = collect(edges(initial_graph))
    final_graph = SimpleWeightedGraph(nv(initial_graph))
    digraph = SimpleDiGraph(initial_graph)
    sort!(edges_initial_graph, rev=true, by = weight)
    i = 1
    while (i <= length(edges_initial_graph))
        src = edges_initial_graph[i].src
        dst = edges_initial_graph[i].dst
        w = edges_initial_graph[i].weight
        rem_edge!(digraph,src,dst)
        if (!SimpleGraphs.is_connected(digraph))
            add_edge!(digraph, src, dst)
            add_edge!(final_graph, src, dst, w)
        end
        i += 1
    end
    return final_graph
end
