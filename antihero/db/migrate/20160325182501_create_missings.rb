class CreateMissings < ActiveRecord::Migration
  def change
    create_table :missings do |t|
      t.string :name
      t.string :item_type
      t.string :current
      t.string :note
      t.references :hero, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
