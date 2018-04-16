class CreateProblemSets < ActiveRecord::Migration[5.1]
  def change
    create_table :problem_sets do |t|
      t.string :arguments
      t.string :answer
      t.references :challenge, foreign_key: true

      t.timestamps
    end
  end
end
