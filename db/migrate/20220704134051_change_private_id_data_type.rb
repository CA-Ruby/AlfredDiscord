class ChangePrivateIdDataType < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :private_id, :bigint
  end
end
