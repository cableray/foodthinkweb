require 'spec_helper'

describe "supplies/index.html.haml" do
  before(:each) do
    assign(:supplies, [
      stub_model(Supply,
        :amount => "",
        :unit => "Unit"
      ),
      stub_model(Supply,
        :amount => "",
        :unit => "Unit"
      )
    ])
  end

  it "renders a list of supplies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Unit".to_s, :count => 2
  end
end
