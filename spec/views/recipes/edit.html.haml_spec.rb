require 'spec_helper'

describe "recipes/edit.html.haml" do
  before(:each) do
    @recipe = assign(:recipe, stub_model(Recipe,
      :name => "MyString",
      :cook_time => 1,
      :prep_time => 1,
      :description => "MyText",
      :steps => "MyText"
    ))
  end

  it "renders the edit recipe form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => recipes_path(@recipe), :method => "post" do
      assert_select "input#recipe_name", :name => "recipe[name]"
      assert_select "input#recipe_cook_time", :name => "recipe[cook_time]"
      assert_select "input#recipe_prep_time", :name => "recipe[prep_time]"
      assert_select "textarea#recipe_description", :name => "recipe[description]"
      assert_select "textarea#recipe_steps", :name => "recipe[steps]"
    end
  end
end
