class AddToUsersPrintScore < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :print_score, :string
  end
end
