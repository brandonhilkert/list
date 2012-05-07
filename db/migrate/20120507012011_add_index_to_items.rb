class AddIndexToItems < ActiveRecord::Migration
  def change
    add_index :items, :list_id
  end
end
