class CreateBoots < ActiveRecord::Migration
  def change
    create_table :boots do |t|
      t.string :name, :null=>false
      t.integer :socrates_id, :null=>false
      t.references :cohort, :null=>false

      t.timestamps
    end
    add_index :boots, :cohort_id
  end
end
