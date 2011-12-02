require 'spec_helper'

describe "units/index.html.haml" do
  before(:each) do
    assign(:units, [
      stub_model(Unit,
        :name => "Name"
      ),
      stub_model(Unit,
        :name => "Name"
      )
    ])
  end

  it "renders a list of units" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
