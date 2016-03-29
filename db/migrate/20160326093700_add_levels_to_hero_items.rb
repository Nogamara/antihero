class AddLevelsToHeroItems < ActiveRecord::Migration
  def change
    add_column :hero_items, :level, :int
    add_column :hero_items, :current_level, :int
  end
end
