require 'set'
require 'logger'
require 'graph'
require 'dfs'
require 'bfs'
require 'topological_sort'

module Graphs
  def self.log
    
    @log ||= begin
      FileUtils.mkdir_p('log')         
      Logger.new('log/test.log')
             end
  end

  def self.build_example
    nodes = [:s,:a,:b,:c,:d,:e].map { |x| Vertex.new(x) }
    s,a,b,c,d,e = nodes
    g = Graph.new(nodes)
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

  def self.build_example2
    nodes = [:s, :a,:b,:c,:d,:e].map { |x| Vertex.new(x) }
    s,a,b,c,d,e =  nodes
    g.add_edge(s,a)
    g.add_edge(a,b)
    g.add_edge(b,c)
    g.add_edge(b,d)
    g.add_edge(d,e)
    g
  end

  def self.run_dfs
    g = build_example
    dfs = DepthFirstSearch.new(g, g.nodes.first)
    log.debug "DFS edge_to: #{dfs.edge_to}"
    e = g.nodes.last
    log.debug "DFS path[s->e] => #{dfs.path_to(e)}"
    d = g.nodes[4]
    log.debug "DFS path[s->e] => #{dfs.path_to(d)}"
  end

  def self.topological_sort
    g = build_example
    ordered_list = TopologicalSort.for(g)
    log.debug "g: #{g.nodes} -> Topological sort: #{ordered_list}"
  end

  def self.run_bfs
    g = build_example
    bfs = BreadthFirstSearch.new(g, g.nodes.first)
    log.debug "bfs.edge_to: #{bfs.edge_to}"
    e = g.nodes.last
    log.debug "BFS shortest-path[s->e] => #{bfs.shortest_path_to(e)}"
    d = g.nodes[4]
    log.debug "BFS shortest-path[s->d] => #{bfs.shortest_path_to(d)}"
  end

end

Graphs.topological_sort
