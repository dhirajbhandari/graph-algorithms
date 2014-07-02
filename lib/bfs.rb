require 'graphs'

module Graphs

  class BreadthFirstSearch
    attr_reader :visited, :graph, :source_node, :edge_to

    def initialize(g,s)
      @graph = g
      @source_node = s
      @visited = Set.new
      @edge_to = {}
      bfs(s)
    end

    def visited?(v)
      @visited.include?(v)
    end

    def bfs(s)
      queue = [s]
      visited << s
      log.debug("visiting start: #{s} visited: #{visited}")
      
      while !queue.empty?
        v = queue.shift
        v.adjacents.each do |adj|
          next if visited?(adj)
          queue << adj
          visited << adj
          log.debug("visiting: #{adj} visited: #{visited}")
          @edge_to[adj] = v
        end
      end
    end

    def shortest_path_to(v)
      return nil unless visited?(v)

      path = []
      cur_node = v
      while (cur_node != source_node)
        path << cur_node
        cur_node = @edge_to[cur_node]
      end
      path << source_node
      path.reverse
    end

    def has_path_to(v)
      visited?(v)
    end

    def log
      Graphs.log
    end
  end
end
