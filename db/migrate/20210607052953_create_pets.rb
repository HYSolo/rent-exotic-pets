class CreatePets < ActiveRecord::Migration[6.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :description
      t.string :type
      t.integer :danger_meter
      t.float :price
      t.string :location
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
