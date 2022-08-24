function hierholzer_algorithm(grafo_inicial)
    curr_path = Any[]
    circuit = Any[]
    actual_vertex = 1
    while (length(collect(edges(g)))!=0)
        out_n = outneighbors(g,actual_vertex)
        b = length(out_n)
        if (b != 0)
            dst_vertex = out_n[1]
            if (!isempty(curr_path) && curr_path[end] != actual_vertex)
                rem_edge!(g,actual_vertex,dst_vertex)
                push!(curr_path, actual_vertex)
            elseif (!isempty(curr_path) && curr_path[end] == actual_vertex)
                rem_edge!(g,actual_vertex,dst_vertex)
            elseif (isempty(curr_path))
                rem_edge!(g,actual_vertex,dst_vertex)
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
    return circuit
end