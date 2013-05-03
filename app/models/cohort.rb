class Cohort < ActiveRecord::Base
  has_many :boots
  #todo :FIX UP FORIEGN KEY ACCESS
  attr_accessible :end_date, :name, :start_date, :socrates_cohort_id, :cohort_id

  validates :name, 
    :uniqueness=>true, 
    :presence=>true


end
