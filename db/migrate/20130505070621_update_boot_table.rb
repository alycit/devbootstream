class UpdateBootTable < ActiveRecord::Migration
  def up
  	rename_column :boots, :cohort_id, :socrates_cohort_id
  end

  def down
  	rename_column :boots, :socrates_cohort_id, :cohort_id
  end
end
