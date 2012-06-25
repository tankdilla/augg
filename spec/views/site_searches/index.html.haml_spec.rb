require 'spec_helper'

describe "site_searches/index" do
  before(:each) do
    assign(:site_searches, [
      stub_model(SiteSearch,
        :site_id => 1,
        :number_of_results_requested => 2,
        :results_params => "Results Params"
      ),
      stub_model(SiteSearch,
        :site_id => 1,
        :number_of_results_requested => 2,
        :results_params => "Results Params"
      )
    ])
  end

  it "renders a list of site_searches" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Results Params".to_s, :count => 2
  end
end
