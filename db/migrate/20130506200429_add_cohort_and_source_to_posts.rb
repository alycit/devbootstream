class AddCohortAndSourceToPosts < ActiveRecord::Migration

  def up
  	add_column :posts, :cohort_id, :integer
  	add_column :posts, :source_id, :integer
  end

  def down
  	remove_column :posts, :cohort_id
  	remove_column :posts, :source_id
  end

end
