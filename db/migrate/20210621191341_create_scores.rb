class CreateScores < ActiveRecord::Migration[6.1]
  def change
    create_table :scores do |t|
      t.references :player, index: true, foreign_key: true
      t.datetime :start_time
      t.integer :points
      t.float :playing_time

      t.timestamps
    end
  end
end
