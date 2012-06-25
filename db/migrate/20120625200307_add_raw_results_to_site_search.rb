class AddRawResultsToSiteSearch < ActiveRecord::Migration
  def change
    add_column :site_searches, :raw_results, :string
  end
end
