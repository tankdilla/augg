require 'spec_helper'

describe "sites/edit" do
  before(:each) do
    @site = assign(:site, stub_model(Site,
      :description => "MyString",
      :url => "MyString",
      :search_string => "MyString",
      :parse_code => "MyString"
    ))
  end

  it "renders the edit site form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sites_path(@site), :method => "post" do
      assert_select "input#site_description", :name => "site[description]"
      assert_select "input#site_url", :name => "site[url]"
      assert_select "input#site_search_string", :name => "site[search_string]"
      assert_select "input#site_parse_code", :name => "site[parse_code]"
    end
  end
end
