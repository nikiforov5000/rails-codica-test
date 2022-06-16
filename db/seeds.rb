# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts "destroy recommendations..."
Recommendation.destroy_all
puts "destroy appointments..."
Appointment.destroy_all
puts "destroy doctors..."
Doctor.destroy_all
puts "destroy category..."
Category.destroy_all
puts "destroy users..."
User.destroy_all

puts "Create new users..."
50.times do
    user = User.new(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
    user.email = Faker::Internet.email
    user.phone_no = Faker::PhoneNumber.cell_phone_with_country_code
    user.password = "password"
    user.save
end

puts "Create new categories..."
categories = %w[Surgeon Pediatrician Optometrist Chiropractor Psychiatrist Podiatrist]
categories.each do |cat|
    Category.create(name: cat)
end

puts "Creating new doctors..."
50.times do
    doctor = Doctor.new(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
    doctor.email = Faker::Internet.email
    doctor.phone_no = Faker::PhoneNumber.cell_phone_with_country_code
    doctor.password = "password"
    doctor.category = Category.all.sample
    doctor.save!
end

puts "Creating new appointments..."
500.times do
    appointment = Appointment.new
    appointment.user = User.all.sample
    appointment.doctor = Doctor.all.sample

    from = Time.now - 30.day
    to = Time.now + 30.days
    appointment.date = Time.at(rand(from..to))
    
    while appointment.doctor.appointments.where(open: true).count > 10
        appointment.doctor = Doctor.all.sample
    end

    appointment.save!
end

puts "Creating new recommendations..."
500.times do
    appointment = Appointment.where(open: true).where('date < ?', Time.now).sample
    recommendation = Recommendation.new(comment: Faker::Lorem.sentence(word_count: rand(2..5)), appointment: appointment)
    recommendation.save!
end
