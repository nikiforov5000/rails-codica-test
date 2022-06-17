require 'rails_helper'

def create_user_with_appointment(doctor)
  phone_no = Faker::PhoneNumber.cell_phone_with_country_code
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = Faker::Internet.email
  password = 'password'
  user = User.create(
    phone_no: phone_no,
    first_name: first_name,
    last_name: last_name,
    email: email,
    password: password
    )
  appointment = Appointment.create(user: user, doctor: doctor, date: Time.now - 1.day)
end

RSpec.feature "Doctors", type: :feature do
  let(:doctor) { create(:random_doctor) }
  
  context 'logs in' do
    it 'fill in form' do
      visit new_doctor_session_path
      appointment = create_user_with_appointment(doctor)
      within('form') do
        fill_in 'Phone no', with: doctor.phone_no
        fill_in 'Password', with: 'password'
      end
      click_button('Log in')
      expect(current_path).to eql('/')
      click_link('Write a recommendation')
      expect(page).to have_content("Recommendation for #{appointment.user.first_name} #{appointment.user.last_name}")
      comment = Faker::Lorem.sentence(word_count: rand(2..5))
      text_area = find(:css, 'textarea#recommendation_comment').set(comment)
      click_button('Create Recommendation')
      expect(comment).to eql(Recommendation.last.comment)
    end
  end
end
