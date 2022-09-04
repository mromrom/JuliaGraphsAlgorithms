using BenchmarkTools
using JuliaGraphsAlgorithms
using Graphs,SimpleWeightedGraphs,SimpleGraphs

DIGRAPHS = Dict{String,DiGraph}(
    "complete80" => complete_digraph(80),
    "path50" => path_digraph(50),
    "star50" => star_digraph(50)
)
GRAPHS = Dict{String,Graph}(
    "petersen" => smallgraph(:petersen),
    "tutte" => smallgraph(:tutte),
    "complete40" => complete_graph(40),
    "wheel20" => wheel_graph(20)
)

WGRAPHS = Dict{String,SimpleWeightedDiGraph}(
    "weighted20" => SimpleWeightedDiGraph(rand(20,20)),
    "weighted50" => SimpleWeightedDiGraph(rand(50,50)),
    "weighted80" => SimpleWeightedDiGraph(rand(80,80))
)

suite = BenchmarkGroup()
include("boruvka.jl")
include("dSatur.jl")
include("hierholzer.jl")
include("kahn.jl")
include("reverse.jl")


tune!(suite);
results = run(suite, verbose=true, seconds=60, samples=10000)
