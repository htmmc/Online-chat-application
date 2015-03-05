require 'faker'

case Rails.env
when "development"	
  50.times do |i|
    User.create!(email: Faker::Internet.email, 
    	password: 'testtest', 
    	username: Faker::Internet.user_name, 
    	name: Faker::Name.name, 
    	description: Faker::Lorem.paragraph(3), 
    	beginning_of_available_time: Faker::Time.forward(2, :morning), 
    	end_of_available_time: Faker::Time.forward(3, :morning), 
    	listener: [true, false].sample,
    	language: ['English', 'Spanish', 'Chinese', 'French', 'English', 'English'].sample,
    	license_type: ['none', 'Licensed Professional Counselor', 'Occupational therapist', 'School Counserlor', 'Licensed Psychologist'].sample,
    	religion: ['none', 'Islam', 'Buddhism', 'Catholicism', 'Protestantism', 'Undisclosed'].sample,
        categories: ['Anxiety','Blah - Everyday matters','Business','Depression','Disability','Eating Disorders','Emotional support','Family Issues','Feeling Lost','Health and Wellness','LGBTQ','Life in general','Panic Attacks','Relationships','Sex','Self-Harm','Substance Abuse','Traumatic Experiences','Work Stress'].sample
    	)
  end
end
   
