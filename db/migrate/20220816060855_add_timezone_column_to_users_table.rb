class AddTimezoneColumnToUsersTable < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :timezone, :string, limit: 255, default: 'UTC'
  end
end
