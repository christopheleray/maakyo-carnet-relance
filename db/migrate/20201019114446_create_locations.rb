class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :address1
      t.string :address2
      t.string :postal_code
      t.string :country
      t.integer :status
      t.timestamps
    end
  end
end
