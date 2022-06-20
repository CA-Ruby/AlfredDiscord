class CreateFlowEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :flow_entries do |t|
      t.string :what
      t.string :feeling
      t.string :flow
      t.references :user, null: false, foreign_key: true
      t.string :activity_name
      t.string :activity_category
      t.integer :challenge_level
      t.integer :skill_level
      t.integer :feeling_competent
      t.integer :mentally_absorbed
      t.integer :clear_objectives
      t.integer :control_situation
      t.integer :free_from_ego
      t.integer :free_from_time
      t.integer :clear_conditions
      t.integer :great_experience
      t.boolean :is_voluntary
      t.integer :happiness_level
      t.integer :social_quality
      t.integer :energy_level

      t.timestamps
    end
  end
end
