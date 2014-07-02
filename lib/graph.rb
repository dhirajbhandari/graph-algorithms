require 'set'
require 'logger'

module Graphs
  class Vertex
    attr_reader :id, :adjacents

    def initialize(id)
      @id = id
      @adjacents = []
    end

    def to_s
      "Node-#{id}"
    end

    def eql?(other)
      id.eql?(other.id)
    end

    def hash
      id.hash
    end
  end

  class Graph
    attr_reader :nodes
    
    def initialize(nodes)
      @nodes = nodes
    end

    def add_edge(v1, v2)
      v1.adjacents << v2
    end
  end

end
