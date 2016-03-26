class CreateHeroClasses < ActiveRecord::Migration
  def change
    create_table :hero_classes do |t|
      t.string :name
      t.string :slug

      t.timestamps null: false
    end
  end
end
