class AddTableToCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :customers, :table, :string
  end
end
