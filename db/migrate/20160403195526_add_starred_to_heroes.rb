class AddStarredToHeroes < ActiveRecord::Migration
  def change
    add_column :heroes, :starred, :integer, default: 0
  end
end
