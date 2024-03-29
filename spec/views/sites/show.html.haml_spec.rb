require 'spec_helper'

describe "sites/show" do
  before(:each) do
    @site = assign(:site, stub_model(Site,
      :description => "Description",
      :url => "Url",
      :search_string => "Search String",
      :parse_code => "Parse Code"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Description/)
    rendered.should match(/Url/)
    rendered.should match(/Search String/)
    rendered.should match(/Parse Code/)
  end
end
