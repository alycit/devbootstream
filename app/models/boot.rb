class Boot < ActiveRecord::Base
  belongs_to :cohort, :foreign_key => 'socrates_cohort_id', :primary_key => 'socrates_cohort_id' 
  has_many :resources
  has_many :posts, :through => :resources
  attr_accessible :name, :socrates_id, :socrates_cohort_id
  #todo DO NOT INCLUDE CHORHOT ID
  validates :name, :socrates_id, 
    :uniqueness=>true, 
    :presence=>true

end
