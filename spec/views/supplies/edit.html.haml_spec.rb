require 'spec_helper'

describe "supplies/edit.html.haml" do
  before(:each) do
    @supply = assign(:supply, stub_model(Supply,
      :amount => "",
      :unit => "MyString"
    ))
  end

  it "renders the edit supply form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => supplies_path(@supply), :method => "post" do
      assert_select "input#supply_amount", :name => "supply[amount]"
      assert_select "input#supply_unit", :name => "supply[unit]"
    end
  end
end
