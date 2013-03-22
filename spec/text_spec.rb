require 'spec_helper'

module NATO
  describe Text do
    Given(:text) { Text.new 'a8h43lnr0' }

    describe "#to_nato" do
      Then { text.should respond_to :to_nato }

      And { text.to_nato.should == 'Alfa 8 Hotel 4 3 Lima November Romeo 0' }
    end

    describe "#to_s" do
      Then { text.to_s.should == ['a8h43lnr0', 'Alfa 8 Hotel 4 3 Lima November Romeo 0'] }
    end
  end
end