class CreateHabitSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :habit_sessions do |t|
      t.integer :repetitions
      t.text :note
      t.integer :mood
      t.integer :duration
      t.references :habit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
