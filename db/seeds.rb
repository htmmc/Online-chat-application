require 'faker'

case Rails.env
when "development"	
  1000.times do |i|
    User.create!(name: Faker::Name.name, email: Faker::Internet.email, birthday: Faker::Date.birthday)
  end
end
