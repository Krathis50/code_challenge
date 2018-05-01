class CreateScoreboards < ActiveRecord::Migration[5.1]
  def change
    create_table :scoreboards do |t|

      t.timestamps
    end
  end
end
