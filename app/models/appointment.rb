class DoctorsAppointmentsValidator < ActiveModel::Validator
  def validate(appointment)
    return if appointment.doctor == nil
    if appointment.doctor.appointments.where(done: false).count > 10
      appointment.errors.add :doctor, "Doctor has more than 10 appointments"
    end
  end
end

class Appointment < ApplicationRecord
  include ActiveModel::Validations

  belongs_to :user
  belongs_to :doctor

  validates :user, presence: true
  validates :doctor, presence: true
  validates_with DoctorsAppointmentsValidator
end