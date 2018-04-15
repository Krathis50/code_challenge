class CreateChallenges < ActiveRecord::Migration[5.1]
  def change
    enable_extension 'pgcrypto'
    create_table :challenges, id: :uuid do |t|
      t.string :name, null: false
      t.text :description, null: false

      t.timestamps
    end
  end
end
