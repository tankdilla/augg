require 'spec_helper'

describe "sites/index" do
  before(:each) do
    assign(:sites, [
      stub_model(Site,
        :description => "Description",
        :url => "Url",
        :search_string => "Search String",
        :parse_code => "Parse Code"
      ),
      stub_model(Site,
        :description => "Description",
        :url => "Url",
        :search_string => "Search String",
        :parse_code => "Parse Code"
      )
    ])
  end

  it "renders a list of sites" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "Search String".to_s, :count => 2
    assert_select "tr>td", :text => "Parse Code".to_s, :count => 2
  end
end
