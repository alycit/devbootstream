class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :posted_time
      t.string :image_url
      t.string :username
      t.references :resource
      
      t.timestamps
    end
  end
end
