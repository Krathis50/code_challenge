class RemoveFieldsFromScoreboards < ActiveRecord::Migration[5.1]
  def change
    remove_column :scoreboards, :name, :string
    remove_column :scoreboards, :school, :string
    remove_column :scoreboards, :score, :int
    remove_column :scoreboards, :team, :string
  end
end
