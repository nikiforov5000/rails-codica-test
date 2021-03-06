class DoctorsAppointmentsValidator < ActiveModel::Validator
  def validate(appointment)
    return if appointment.doctor == nil
    if appointment.doctor.appointments.where(open: true).count > 10
      appointment.errors.add :doctor, "This doctor has 10 appointments"
    end
  end
end

class Appointment < ApplicationRecord
  include ActiveModel::Validations

  belongs_to :user
  belongs_to :doctor
  has_one :recommendation

  validates :user, presence: true
  validates :doctor, presence: true
  validates_with DoctorsAppointmentsValidator
end