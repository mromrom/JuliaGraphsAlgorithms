using Graphs
function dSatur_algorithm(g)
    colors_vertex = zeros(nv(g))
    vertices_a = collect(vertices(g))
    while (findfirst(x->x==0,colors_vertex)!=nothing)
        if (findfirst(x->x!=0,colors_vertex)!=nothing)
            v_max_dsatur = vertex_with_max_saturation_degree(g,colors_vertex)
            color_vertex(g,v_max_dsatur,colors_vertex)
        else
            sort!(vertices_a, rev=true, by = x-> degree(g,x))
            color_vertex(g,vertices_a[1],colors_vertex)
        end
    end

    return colors_vertex;
end

function color_vertex(g,v,colored_vertex)
    neighbors_v = outneighbors(g,v)
    color = 1
    for i in 1:length(neighbors_v)
        #Comprobamos si alguno de los vecinos está coloreado con el mismo color que queremos colorear nosotros el vértice actual
        if (findfirst(x->colored_vertex[x]==color,neighbors_v)!=nothing)
            color = color + 1;
            colored_vertex[v] = color
        else
            colored_vertex[v] = color
        end
    end
end


function saturation_degree(g,colors_vertex,v)
    colors=Int64[]
    neighbors_v = outneighbors(g,v)
    neighbors_v = findall(x_c->colors_vertex[x_c]!=0,neighbors_v)
    for i in 1:length(neighbors_v)
        if (colors_vertex[neighbors_v[i]] != 0)
        push!(colors,colors_vertex[neighbors_v[i]])
        end
    end
    unique!(colors)
    return length(colors);
end

function vertex_with_max_saturation_degree(g,color_vertex)
    vertex_Stur = []
    for i in 1:nv(g)
        push!(vertex_Stur,saturation_degree(g,color_vertex,i))
    end
    #Aquí tenemos una lista con los vértices con su correspondiente grado de saturación
    #Aquellos que han sido coloreados, tienen el valor seteado a 0
    vertex_Stur_already_colored = vertices_already_colored(vertex_Stur,color_vertex)
    max_dSatur = maximum(vertex_Stur_already_colored);
    vertices_with_max_dSatur = findall(x_c->x_c==max_dSatur,vertex_Stur_already_colored)
    if (length(vertices_with_max_dSatur) != 1)
        sort!(vertices_with_max_dSatur, rev=true, by = x-> degree(g,x))
    end
    vertex_with_max_dSatur = vertices_with_max_dSatur[1]
end

function vertices_already_colored(vertices_a, color_vertex)
    vertex_res = Any[]
    vertex_already_colored = findall(x_c->x_c!=0,color_vertex)
    for i in 1:length(vertices_a)
        if (findfirst(x_c->x_c==i,vertex_already_colored)!=nothing)
            push!(vertex_res, -1)
        else
            push!(vertex_res, vertices_a[i])
        end
    end
    return vertex_res
end
