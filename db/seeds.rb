require 'csv'

def cleanse_http(url)
  if url.match(/(.com\/)(.+)/)
    url.match(/(.com\/)(.+)/)[2]
  elsif url.include?('@')
    url.match(/(@)(.+)/)[2]
  elsif url.match(/(\/\/.+)/)
    url.match(/(\/\/)(.+)/)[2]
  else
    false
  end
end

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
    puts "Working on #{row['twitter']}"
    #FIX THIS SILLY IF BELOW
    # stripped_http = stripped_http[2] if stripped_http
    if cleanse_http(row['twitter'])
      twitter = boot.resources.new(
       :identifier => cleanse_http(row['twitter']),
       :source => 'twitter',
       :user_name => row['name']  	
       )

      twitter.save
    end
  end
  


  if row['blog'] =~ /(\w+.tumblr.com)/
    unless row['blog'].include?("www.")
     stripped_http = row['blog'].match(/(\w+.tumblr.com)/).to_a.first
     tumblr = boot.resources.new(

       :identifier => stripped_http,
       :source => 'tumblr',
       :user_name => row['name']    

       )

     tumblr.save
   end
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

instagram = Resource.new(:user_name => 'public', :source => 'instagram')
instagram.save

twitter = Resource.new(:user_name => 'public', :source => 'twitter')
twitter.save

puts "Boots added: #{Boot.all.length}"
puts "Resources added: #{Resource.all.length}"
puts "Cohorts added: #{Cohort.all.length}"
puts "Instagram public resource created: #{instagram}"

