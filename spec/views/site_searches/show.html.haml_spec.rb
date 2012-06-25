require 'spec_helper'

describe "site_searches/show" do
  before(:each) do
    @site_search = assign(:site_search, stub_model(SiteSearch,
      :site_id => 1,
      :number_of_results_requested => 2,
      :results_params => "Results Params"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Results Params/)
  end
end
