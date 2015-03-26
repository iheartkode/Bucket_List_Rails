class AddDoneToItems < ActiveRecord::Migration
  def change
    add_column :items, :done, :check_box
  end
end
