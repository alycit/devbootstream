class AddDataToPosts < ActiveRecord::Migration
  def up
    add_column :posts, :data, :text, :null=>true
  end
  def down
    remove_column :posts, :data
  end
end
