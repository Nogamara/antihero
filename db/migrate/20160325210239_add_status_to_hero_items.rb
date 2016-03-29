class AddStatusToHeroItems < ActiveRecord::Migration
  def change
    add_column :hero_items, :status, :string
  end
end
