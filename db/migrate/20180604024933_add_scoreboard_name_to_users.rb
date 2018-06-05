class AddScoreboardNameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :scoreboard_name, :string
    add_column :users, :scoreboard_school, :string
  end
end
