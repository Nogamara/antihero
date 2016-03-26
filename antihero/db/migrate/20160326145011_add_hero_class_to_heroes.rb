class AddHeroClassToHeroes < ActiveRecord::Migration
  def change
    add_reference :heroes, :hero_class, index: true, foreign_key: true
  end
end
