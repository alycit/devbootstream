class AddIndex < ActiveRecord::Migration
  def up
  	add_index :posts, :source
  	add_index :posts, :cohort
  	add_index :posts, :phase_id
  end

  def down
  	remove_index :posts, :source
  	remove_index :posts, :cohort
  	remove_index :posts, :phase_id
  end
end
