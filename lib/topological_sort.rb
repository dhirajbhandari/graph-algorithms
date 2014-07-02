require 'set'
require 'logger'
require_relative 'graph'

module Graphs
  class TopologicalSort

    def self.for(g)
      nodes = Set.new(g.nodes)
      return [] if nodes.empty?
      ordered_list = []
      explored = Set.new
      curr_label = nodes.size
      while curr_label > 0
        v = nodes.first
        sink = find_sink(v, explored)
        ordered_list[curr_label] = sink
        curr_label -= 1
        nodes.delete(sink)
        #puts "curr_list :#{ordered_list} curr_label: #{curr_label}"
      end
      ordered_list[1,ordered_list.size]
    end

    def self.find_sink(node, explored)
      node.adjacents.each do |adj|
        if !explored.include?(adj)
          return find_sink(adj, explored)
        end
      end
      raise "Invalid state[node: #{node}, explored: #{explored.inspect}]" if explored.include?(node)
      explored << node
      node
    end
  end
end
