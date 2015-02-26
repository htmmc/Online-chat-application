require 'faker'

case Rails.env
when "development"	
  50.times do |i|
    User.create!(email: Faker::Internet.email, password: Faker::Internet.password)
  end
end
