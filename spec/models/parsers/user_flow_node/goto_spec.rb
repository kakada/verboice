require 'spec_helper'

module Parsers
  module UserFlowNode
    describe Goto do

      let(:call_flow) { self }

      it "should compile to a verboice equivalent flow" do
        play = Goto.new call_flow, 'id' => 1,
          'type' => 'goto',
          'jump' => 3


        play.equivalent_flow.first.should eq(
          Compiler.parse do
            Goto 3
          end.first
        )
      end
      def id
        1
      end
    end
  end
end