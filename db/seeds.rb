require 'faker'

case Rails.env
when "development"	
  50.times do |i|
    User.create!(email: Faker::Internet.email, password: Faker::Internet.password, name: Faker::Name.name, description: Faker::Lorem.paragraph(3), beginning_of_available_time: Faker::Time.forward(2, :morning), end_of_available_time: Faker::Time.forward(3, :morning), listener: [true, false].sample)
  end
end
   