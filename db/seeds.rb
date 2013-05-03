# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

cohort = Cohort.create(:name=>"Golden Bears", :start_date=>Date.today, :end_date=>Date.today)

u1 = cohort.boots.create(:name=>"Johny", :socrates_id=>0)

u2 = cohort.boots.create(:name=>"Charles", :socrates_id=>1)

u1.resources.create(
  :identifier=>"jho406.tumblr.com", 
  :user_name=>"jho406", 
  :source=>"tumblr")

u2.resources.create(
  :identifier=>"banker-hacker.tumblr.com", 
  :user_name=>"banker-hacker", 
  :source=>"tumblr")
