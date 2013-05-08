class Boot < ActiveRecord::Base
  belongs_to :cohort, :foreign_key => 'socrates_cohort_id', :primary_key => 'socrates_cohort_id' 
  has_many :resources
  has_many :posts, :through => :resources
  attr_accessible :name, :socrates_id, :socrates_cohort_id
  #todo DO NOT INCLUDE CHORHOT ID
  validates :name, :socrates_id, 
  :uniqueness=>true, 
  :presence=>true

  def current_phase(when_date=Date.today)
    week_number = self.current_week(when_date)
    (week_number/3.0).ceil
  end

  def current_week(when_date=Date.today)
    start_date = cohort.start_date
    days_past = (when_date.to_date - start_date).to_f
    week_number = (days_past/7).ceil

    case
    when week_number < 1 then 0
    when week_number > 12 then 13
    else week_number
    end

  end

end
