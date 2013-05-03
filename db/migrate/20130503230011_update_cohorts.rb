class UpdateCohorts < ActiveRecord::Migration
  def up
  	add_column :cohorts, :socrates_cohort_id, :integer, :null=>false
  	remove_column :cohorts, :end_date
  end

  def down
  	remove_column :cohorts, :socrates_cohort_id
  	add_column :cohorts, :end_date, :date
  end
end
