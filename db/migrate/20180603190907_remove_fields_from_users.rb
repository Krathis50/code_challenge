class RemoveFieldsFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :name, :string
    remove_column :users, :school, :string
    remove_column :users, :team, :string
    remove_column :users, :score, :int
  end
end
