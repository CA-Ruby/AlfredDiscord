class ChangeColumnFirstNameToNameToUser < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :first_name, :name
  end
end
