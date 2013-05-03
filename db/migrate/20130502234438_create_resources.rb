class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :url
      t.string :type
      t.references :post
      
      t.timestamps
    end
  end
end
