class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :last_name
      t.string :first_name
      t.boolean :flow_testing
      t.string :flow_test_intervals
      t.string :private_id
      t.string :role

      t.timestamps
    end
  end
end
