require 'spec_helper'

describe Supply do
  describe "factory" do
    subject {FactoryGirl.create :supply}
    it{should be_valid}
  end

  

end
