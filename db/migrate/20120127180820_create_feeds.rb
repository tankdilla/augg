class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.string :description
      t.string :uri

      t.timestamps
    end
  end
end
