class CreateHeroes < ActiveRecord::Migration
  def change
    create_table :heroes do |t|
      t.string :name
      t.string :spec_name
      t.string :spec_url

      t.timestamps null: false
    end
  end
end
