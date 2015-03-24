class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.text :item
      t.timestamps null: false
    end
  end
end
