class AddLevelToHeroes < ActiveRecord::Migration
  def change
    add_column :heroes, :level, :int
  end
end
