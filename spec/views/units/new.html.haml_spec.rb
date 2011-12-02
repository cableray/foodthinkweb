require 'spec_helper'

describe "units/new.html.haml" do
  before(:each) do
    assign(:unit, stub_model(Unit,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new unit form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => units_path, :method => "post" do
      assert_select "input#unit_name", :name => "unit[name]"
    end
  end
end
