class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :description
      t.string :url
      t.string :search_string
      t.string :parse_code

      t.timestamps
    end
  end
end
