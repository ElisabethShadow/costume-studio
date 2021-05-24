class CreateCostumes < ActiveRecord::Migration[6.1]
  def change
    create_table :costumes do |t|
      t.string :name
      t.string :size
      t.string :category
      t.decimal :price
      t.string :description
      t.references :user_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
