class AddIbLinksToHeroItems < ActiveRecord::Migration
  def change
    add_column :hero_items, :ib_id, :string
    add_column :hero_items, :current_ib_id, :string
  end
end
