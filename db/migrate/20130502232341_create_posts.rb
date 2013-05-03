class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :blob
      t.references :resource
      t.timestamps
    end
  end
end
