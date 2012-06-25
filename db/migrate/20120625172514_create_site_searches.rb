class CreateSiteSearches < ActiveRecord::Migration
  def change
    create_table :site_searches do |t|
      t.integer :site_id
      t.datetime :search_run_on
      t.integer :number_of_results_requested
      t.string :results_params

      t.timestamps
    end
  end
end
