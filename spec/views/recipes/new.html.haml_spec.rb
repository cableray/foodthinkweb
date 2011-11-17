require 'spec_helper'

describe "recipes/new.html.haml" do
  before(:each) do
    assign(:recipe, stub_model(Recipe,
      :name => "MyString",
      :cook_time => 1,
      :prep_time => 1,
      :description => "MyText",
      :steps => "MyText"
    ).as_new_record)
  end

  it "renders new recipe form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => recipes_path, :method => "post" do
      assert_select "input#recipe_name", :name => "recipe[name]"
      assert_select "input#recipe_cook_time", :name => "recipe[cook_time]"
      assert_select "input#recipe_prep_time", :name => "recipe[prep_time]"
      assert_select "textarea#recipe_description", :name => "recipe[description]"
      assert_select "textarea#recipe_steps", :name => "recipe[steps]"
    end
  end
end
