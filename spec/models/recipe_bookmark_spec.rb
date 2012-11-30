require 'spec_helper'

describe RecipeBookmark do
  describe "factory" do
    subject {FactoryGirl.create :recipe_bookmark}
    it{should be_valid}
  end

  describe "associations" do
    it {should belong_to :recipe}
    it {should belong_to :user}
  end

  describe "validations" do
    it {should validate_uniqueness_of(:recipe_id).scoped_to(:user_id).with_message(/recipe has already been saved/i)}
  end

end
