class AddRoleId < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :account_id, :integer
  end
end
