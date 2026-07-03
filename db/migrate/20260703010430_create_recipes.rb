class CreateRecipes < ActiveRecord::Migration[8.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :chef
      t.string :ingredients
      t.string :directions
      t.integer :prep_time

      t.timestamps
    end
  end
end
