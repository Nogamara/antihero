class AddLevelsToItems < ActiveRecord::Migration
  def change
    add_column :items, :level, :int
    add_column :items, :current_level, :int
  end
end
