class AddSecretAndCustomerIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :secret, :string
    add_column :users, :customer_id, :string
  end
end
