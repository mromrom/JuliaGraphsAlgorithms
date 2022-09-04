function hierholzer_algorithm(g)
    graph_copy = g
    curr_path = Any[]
    circuit = Any[]
    actual_vertex = 1

    while (length(collect(edges(graph_copy)))!=0)
        out_n = outneighbors(graph_copy,actual_vertex)
        b = length(out_n)
        if (b != 0)
            dst_vertex = out_n[1]
            if (!isempty(curr_path) && curr_path[end] != actual_vertex)
                rem_edge!(graph_copy,actual_vertex,dst_vertex)
                push!(curr_path, actual_vertex)
            elseif (!isempty(curr_path) && curr_path[end] == actual_vertex)
                rem_edge!(graph_copy,actual_vertex,dst_vertex)
            elseif (isempty(curr_path))
                rem_edge!(graph_copy,actual_vertex,dst_vertex)
                push!(curr_path, actual_vertex)
            end
            actual_vertex = dst_vertex
        else
            push!(circuit, actual_vertex)
            vertex_before = curr_path[end]
            if (curr_path[end] == actual_vertex)
                pop!(curr_path)
                vertex_before = curr_path[end]
            end
            actual_vertex = vertex_before
        end
    end
    push!(curr_path, actual_vertex)
    reverse!(curr_path)
    append!(circuit,curr_path)
    reverse!(circuit)
    if (circuit[1] != circuit[end])
        return "El grafo no es euleriano"
    else
        return circuit
    end
end
