class AddFieldsToScoreboards < ActiveRecord::Migration[5.1]
  def change
    add_column :scoreboards, :scoreboard_name, :string
    add_column :scoreboards, :scoreboard_school, :string
    add_column :scoreboards, :scoreboard_score, :int
    add_column :scoreboards, :scoreboard_team, :string
  end
end
