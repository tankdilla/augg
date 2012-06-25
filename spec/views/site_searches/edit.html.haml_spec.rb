require 'spec_helper'

describe "site_searches/edit" do
  before(:each) do
    @site_search = assign(:site_search, stub_model(SiteSearch,
      :site_id => 1,
      :number_of_results_requested => 1,
      :results_params => "MyString"
    ))
  end

  it "renders the edit site_search form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => site_searches_path(@site_search), :method => "post" do
      assert_select "input#site_search_site_id", :name => "site_search[site_id]"
      assert_select "input#site_search_number_of_results_requested", :name => "site_search[number_of_results_requested]"
      assert_select "input#site_search_results_params", :name => "site_search[results_params]"
    end
  end
end
