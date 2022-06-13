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
    doctor.password = "password"
    doctor.category = Category.all.sample
    doctor.save!
end

puts "Creating new appointments..."
500.times do
    appointment = Appointment.new
    appointment.user = User.all.sample
    appointment.doctor = Doctor.all.sample
    
    while appointment.doctor.appointments.where(open: true).count > 10
        appointment.doctor = Doctor.all.sample
    end

    appointment.save!
end

# puts "Creating new recommendations..."
# 250.times do
#     recommendation = Recommendation.new
#     appointments = Appointment.where(open: true)
#     recommendation.appointment = appointments.sample
#     recommendation.comment = Faker::Lorem.sentence(word_count: rand(2..5))
#     recommendation.appointment.update(open: false)
#     recommendation.save!
# end



