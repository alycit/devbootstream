class Boot < ActiveRecord::Base
  belongs_to :cohort, :foreign_key => 'socrates_cohort_id', :primary_key => 'socrates_cohort_id' 
  has_many :resources
  has_many :posts, :through => :resources
  attr_accessible :name, :socrates_id, :socrates_cohort_id
  #todo DO NOT INCLUDE CHORHOT ID
  validates :name, :socrates_id, 
    :uniqueness=>true, 
    :presence=>true

  def current_phase
    week_number = self.current_week
    (week_number/3.0).ceil
  end

  def current_week
    start_date = cohort.start_date
    current_date = Date.today
    days_past = (current_date - start_date).to_f
    week_number = (days_past/7).ceil
    week_number = 0 if week_number < 1
    week_number = 13 if week_number > 12
    week_number
  end

end
