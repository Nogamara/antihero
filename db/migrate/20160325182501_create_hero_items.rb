class CreateHeroItems < ActiveRecord::Migration
  def change
    create_table :hero_items do |t|
      t.string :name
      t.string :item_type
      t.string :current
      t.string :note
      t.references :hero, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
