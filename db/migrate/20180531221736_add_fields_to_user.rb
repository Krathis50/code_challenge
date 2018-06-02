class AddFieldsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :school, :string
    add_column :users, :score, :int
    add_column :users, :team, :string
    add_column :users, :name, :string
  end
end
