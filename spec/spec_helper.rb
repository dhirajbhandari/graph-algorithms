
$LOAD_PATH << File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'rspec'
require 'graphs'


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

def log
  Graphs.log
end
