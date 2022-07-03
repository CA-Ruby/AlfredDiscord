class AddColumnPrivateIdToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :private_id, :integer
  end
end
