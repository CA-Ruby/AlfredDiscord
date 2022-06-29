class RemoveColumnPrivateIdToUser < ActiveRecord::Migration[7.0]
  def change
    remove_column(:users, :private_id)
  end
end
