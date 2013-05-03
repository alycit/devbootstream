class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :url
      t.string :title
      t.text :body
      t.string :media_type, :null=>false
      t.references :resource, :null=>false
      t.datetime :posted_at, :null=>false

      t.timestamps
    end
    add_index :posts, :resource_id
  end
end
