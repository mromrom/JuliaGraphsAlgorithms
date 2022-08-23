module JuliaGraphsAlgorithms

# Write your package code here..
using Graphs
using SimpleWeightedGraphs
using SimpleGraphs

export reverse_delete_algorithm
include("reverse_delete.jl")

export boruvka_algorithm
include("boruvka_algorithm.jl")

export dSatur_algorithm
export color_vertex
export saturation_degree
export vertex_with_max_saturation_degree
export vertices_already_colored
include("dSatur_algorithm.jl")

export hierholzer_algorithm
include("hierholzer_algorithm.jl")

export topological_sort_by_kahn
include("kahn_algorithm.jl")
end
