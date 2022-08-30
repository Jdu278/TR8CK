class CreateHabits < ActiveRecord::Migration[7.0]
  def change
    create_table :habits do |t|
      t.string :title
      t.text :description
      t.string :needed_session_properties
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
