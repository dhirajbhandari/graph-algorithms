require_relative 'spec_helper'

describe Graphs::BreadthFirstSearch do
  let(:g) { example_graph }
  describe '#shortest_path_to' do
    it 'should give the shortest path from the source node to the given node' do
      bfs = Graphs::BreadthFirstSearch.new(g, g.nodes[0])
      path = bfs.shortest_path_to(g.nodes[4])
      path.should == [g.nodes[0], g.nodes[2], g.nodes[4]]
    end
  end

   def example_graph
    nodes = [:s,:a,:b,:c,:d,:e].map { |x| Graphs::Vertex.new(x) }
    s,a,b,c,d,e = nodes
    g = Graphs::Graph.new(nodes)
    g.add_edge(s,a)
    g.add_edge(s,b)
    g.add_edge(a,c)
    g.add_edge(b,d)
    #g.add_edge(c,d)
    g.add_edge(c,e)
    #g.add_edge(d,e)

    #short-cut
    g.add_edge(b,e)
    g
  end
end
