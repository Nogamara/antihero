class AddColorToHeroes < ActiveRecord::Migration
  def change
    add_column :heroes, :color, :string
  end
end
