class SiteSearch < ActiveRecord::Base
  attr_accessible :number_of_results_requested, :results_params, :search_run_on, :site_id
end
