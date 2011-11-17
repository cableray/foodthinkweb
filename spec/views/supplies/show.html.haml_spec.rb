require 'spec_helper'

describe "supplies/show.html.haml" do
  before(:each) do
    @supply = assign(:supply, stub_model(Supply,
      :amount => "",
      :unit => "Unit"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Unit/)
  end
end
