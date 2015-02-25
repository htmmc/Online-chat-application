require 'faker'

case Rails.env
when "development"	
  50.times do |i|
    User.create!(name: Faker::Name.name, email: Faker::Internet.email)
  end
end
