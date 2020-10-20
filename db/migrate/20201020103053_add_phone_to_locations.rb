class AddPhoneToLocations < ActiveRecord::Migration[6.0]
  def change
    add_column :locations, :phone, :string
  end
end
