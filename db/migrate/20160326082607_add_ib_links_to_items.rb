class AddIbLinksToItems < ActiveRecord::Migration
  def change
    add_column :items, :ib_id, :string
    add_column :items, :current_ib_id, :string
  end
end
