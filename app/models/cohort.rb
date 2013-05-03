class Cohort < ActiveRecord::Base
  has_many :boots
  attr_accessible :end_date, :name, :start_date

  validates :name, 
    :uniqueness=>true, 
    :presence=>true

end
