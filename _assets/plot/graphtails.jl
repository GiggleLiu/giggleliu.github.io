using LuxorGraphPlot, Graphs, Random
using LuxorGraphPlot: Luxor

function graphwithtail(; tailn::Int)
    rot15(a, b, i::Int) = cos(2i*π/5)*a + sin(2i*π/5)*b, cos(2i*π/5)*b - sin(2i*π/5)*a
    locations = [[rot15(0.0, -1.2, i) for i=-1:3]..., [rot15(0.0, -0.6, i) for i=-1:3]...]
    vertex_colors = ["red", "red", "red", fill("black", 7+(tailn+3)*3)...]

    g0 = smallgraph(:petersen)
    graph = SimpleGraph((tailn+3) * 3 + 10)
    for edge in edges(g0)
        add_edge!(graph, edge)
    end
    for i=1:3
        for j=1:tailn
            add_edge!(graph, j==1 ? i : 10+(i-1)*tailn+j-1, 10+(i-1)*tailn+j)
            push!(locations, rot15(0.0, -1.2-0.6*j, i-2))
        end
    end
    for i=1:3
        for j=1:tailn
            push!(locations, rot15(0.0, -3.3 - j*0.1, i-2))
        end
    end
    return graph, locations, vertex_colors
end
graph, locations, vertex_colors = graphwithtail(; tailn=3)
show_graph(graph; locs=locations, format=:svg, vertex_colors, texts=fill("", nv(graph)), vertex_sizes=[fill(0.2, nv(graph)-9)..., fill(0.01, 9)...], filename="halfchain.svg")