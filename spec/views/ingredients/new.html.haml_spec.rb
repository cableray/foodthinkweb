require 'spec_helper'

describe "ingredients/new.html.haml" do
  before(:each) do
    assign(:ingredient, stub_model(Ingredient,
      :name => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new ingredient form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => ingredients_path, :method => "post" do
      assert_select "input#ingredient_name", :name => "ingredient[name]"
      assert_select "textarea#ingredient_description", :name => "ingredient[description]"
    end
  end
end
