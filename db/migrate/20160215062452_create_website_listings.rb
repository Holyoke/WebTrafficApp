class CreateWebsiteListings < ActiveRecord::Migration
  def change
    create_table :website_listings do |t|
      t.string :name, null: false
      t.string :url, null: false
      t.integer :rank
      t.text :note

      t.timestamps null: false
    end
  end
end
