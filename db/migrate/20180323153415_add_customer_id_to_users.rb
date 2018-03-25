class AddCustomerIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :customer_id, :integer, column_options: { null: true }
    add_column :users, :secret, :string, column_options: { null: true }
  end
end
