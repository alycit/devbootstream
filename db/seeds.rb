require 'csv'

Boot.destroy_all
Resource.destroy_all
Cohort.destroy_all


CSV.foreach('db/bootseed.csv', :headers => true) do |row|

  boot = Boot.new(

    :name => row['name'], 
    :socrates_id => row['socrates_id'],
    :cohort_id => row['cohort_id'],

    )

    boot.save

  if row['twitter']

   twitter = boot.resources.new(

     :identifier => row['twitter'],
	 :source => 'twitter',
	 :user_name => row['name']  	

   	)

   	twitter.save

  end
  
  if row['tumblr'] 
    
   tumblr = boot.resources.new(

     :identifier => row['blog'],
	 :source => 'tumblr',
	 :user_name => row['name']    

   	) 	
	
	tumblr.save

  end
  
  unless Cohort.find_by_socrates_cohort_id(row['cohort_id'])

    cohort = Cohort.new(

	 :name => row['cohort_name'], 
	 :socrates_cohort_id => row['cohort_id'],
	 :start_date => row['start_date']

    )

    cohort.save
    puts cohort.name
  end
end

puts "Boots added: #{Boot.all.length}"
puts "Resources added: #{Resource.all.length}"
puts "Cohorts added: #{Cohort.all.length}"
