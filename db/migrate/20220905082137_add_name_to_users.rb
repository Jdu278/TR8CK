class AddNameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :completed_habits, :integer
    add_column :users, :future_habits, :text
  end
end
