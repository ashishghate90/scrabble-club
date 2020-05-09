class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.string :location
      t.integer :winner_id
      t.integer :looser_id
      t.integer :winner_points
      t.integer :looser_points

      t.timestamps
    end
  end
end
