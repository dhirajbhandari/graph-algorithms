require_relative 'spec_helper'

describe Graphs::DepthFirstSearch do
  let(:g) { example_graph }
  describe '#visited' do
    it 'should be a depth first' do
      dfs = Graphs::DepthFirstSearch.new(g, g.nodes[0])
      dfs.visited.should == [g.nodes[0], g.nodes[1], g.nodes[3], g.nodes[5], g.nodes[2], g.nodes[4]]
    end
  end

end
