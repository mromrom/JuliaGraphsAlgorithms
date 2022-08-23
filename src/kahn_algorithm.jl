function topological_sort_by_kahn(g)
    graph_copy = copy(g)
    vertices_graph = collect(vertices(graph_copy))
    edges_graph = collect(edges(graph_copy))
    vertices_with_zero_in_degree = findall(x->indegree(graph_copy,x)==0,vertices_graph)
    sorted_elements = Any[]

    while !isempty(vertices_with_zero_in_degree)
        #Cojo siempre el primer elemento en cada iteración
        n = rand(1:length(vertices_with_zero_in_degree))
        vertex = vertices_with_zero_in_degree[n]
        #Elimino el primer elemento tras haberlo cogido
        popat!(vertices_with_zero_in_degree,n)
        #Aniado a los elementos ordenados
        push!(sorted_elements,vertex)
        #Todas las aristas que salen desde vertex
        edges_from_vertex_indexes = findall(x->x.src == vertex, edges_graph)
        edges_from_vertex = Any[]
        if (!isempty(edges_from_vertex_indexes))
            for i in 1:length(edges_from_vertex_indexes)
                push!(edges_from_vertex, edges_graph[edges_from_vertex_indexes[i]])
            end
        end
        for i in 1:length(edges_from_vertex)
            edge_from_vertex_index = findfirst(isequal(edges_from_vertex[i]),edges_graph);
            if (edge_from_vertex_index!=nothing)
                dst_c = edges_graph[edge_from_vertex_index].dst
                popat!(edges_graph,edge_from_vertex_index)
                rem_edge!(graph_copy,vertex,dst_c)
                d = indegree(graph_copy,dst_c)
                if (d==0)
                    push!(vertices_with_zero_in_degree,dst_c)
                end
            end
        end
    end
    return sorted_elements
end
