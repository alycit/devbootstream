class AddCohortAndSourceToPostsRemoveOld < ActiveRecord::Migration
  def up
  	remove_column :posts, :cohort_id
  	remove_column :posts, :source_id
    add_column :posts, :cohort, :string
  	add_column :posts, :source, :string
  end

  def down
  	add_column :posts, :cohort_id, :integer
  	add_column :posts, :source_id, :integer
  	remove_column :posts, :cohort
  	remove_column :posts, :source
  end
end
