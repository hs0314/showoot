class CreateCloths < ActiveRecord::Migration[5.2]
  def change
    create_table :cloths do |t|
      t.references :codi, foreign_key: true
      t.integer :color
      t.integer :main_category
      t.integer :sub_category

      t.timestamps
    end
  end
end
