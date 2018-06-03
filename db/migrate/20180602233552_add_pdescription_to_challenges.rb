class AddPdescriptionToChallenges < ActiveRecord::Migration[5.1]
  def change
    add_column :challenges, :pdescription, :text
  end
end
