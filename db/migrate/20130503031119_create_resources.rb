class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.references :boot
      t.integer :identifier, :null=>false
      t.string :user_name, :null=>false
      t.string :source, :null=>false
      t.string :profile_pic_url

      t.timestamps
    end
    add_index :resources, :boot_id
  end
end
