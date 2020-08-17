class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.string :category
      t.string :brand
      t.string :model
      t.string :motorizing
      t.text :description
      t.datetime :start_date
      t.datetime :end_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
