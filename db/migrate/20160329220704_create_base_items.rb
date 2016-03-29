class CreateBaseItems < ActiveRecord::Migration
  def change
    create_table :base_items do |t|
      t.string :name
      t.string :item_type
      t.integer :ib_id
      t.string :ib_extra

      t.timestamps null: false
    end
  end
end
