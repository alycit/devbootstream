class Cohort < ActiveRecord::Base
  has_many :boots
  attr_accessible :socrates_cohort_id, :name, :start_date, :cohort_id
end
