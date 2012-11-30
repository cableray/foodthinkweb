require 'spec_helper'

describe Ingredient do
  describe "factory" do
    subject {FactoryGirl.create :ingredient}
    it{should be_valid}
  end

  describe "associations" do
    it {should have_many :supplies}
    it {should have_many :recipes}
  end
end
