require 'spec_helper'

describe Recipe do

  def new_recipe(params={})
    FactoryGirl.create(:recipe, params)
  end

  describe "factory" do
    subject {FactoryGirl.create :recipe}
    it{should be_valid}
  end

  describe "associations" do
    it {should have_many :ingredients}
    it {should have_many :recipe_bookmarks}
    it {should have_many :clippers}
    it {should have_and_belong_to_many :tags}
  end

  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_numericality_of(:cook_time)}
  end

  describe "#total_time" do
    let(:recipe){new_recipe(cook_time:11, prep_time:7)}
    subject {recipe.total_time}
    it {should == 18}
  end

  describe "cook and prep times" do
    pending "test or deprecate/refactor"
  end

  describe "#ingredients_box" do
    let(:recipe) {new_recipe}
    subject {recipe.ingredients_box}
    context "when nil" do
      before {recipe.ingredients_box=nil}
      it {should == ""}
    end
    context "when set to 'hello'" do
      let!(:value){"hello"}
      before {recipe.ingredients_box=value}
      it {should == value}
    end
  end

  describe "#assign_supplies" do
    pending "test or deprecate/refactor"
  end
end
