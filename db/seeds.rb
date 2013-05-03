# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

###### Cohorts ######
golden_bears = Cohort.create(name: "golden bears", start_date: DateTime.new(2013, 3, 11), end_date: DateTime.new(2013, 5, 10))


###### Boots #######
wayne = golden_bears.boots.create(name: "Wayne Yang", socrates_id: 666 )



####### Resources #####
wayne.resources.create(source: "instagram", identifier: 357627834, user_name: "waysidekoi")

