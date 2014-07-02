require 'set'
require 'logger'
require_relative 'graph'

module Graphs
  class DepthFirstSearch
    attr_reader :visited, :graph, :source_node, :edge_to

    def initialize(g,s)
      @graph = g
      @source_node = s
      @visited = [] #Set.new
      @edge_to = {}
      dfs(s)
    end

    def visited?(v)
      @visited.include?(v)
    end

    def dfs(s)
      dfs_recur(s)
    end

    def dfs_recur(s)
      visited << s
      stack = [s]
      v = s 
      v.adjacents.each do |adj|
        next if visited?(adj)
        dfs_recur(adj)
        @edge_to[adj] = v
      end
    end

    def dfs_iter(s)
      stack = [s]
      visited << s
      while !stack.empty?
        v = stack.pop
        v.adjacents.each do |adj|
          next if visited?(adj)
          stack.push(adj)
          @edge_to[adj] = v
        end
      end
    end

    #WARN: wont be the shortest-path
    def path_to(v)
      return nil unless @visited.include?(v)

      path = []
      cur_node = v
      while (cur_node != source_node)
        path << cur_node
        cur_node = @edge_to[cur_node]
      end
      path << source_node
      path.reverse
    end

  end
end
