class AddUserToHeroes < ActiveRecord::Migration
  def change
    add_reference :heroes, :user, index: true, foreign_key: true
  end
end
