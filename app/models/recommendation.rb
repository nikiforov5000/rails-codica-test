class Recommendation < ApplicationRecord
  belongs_to :appointment
  validates :appointment, presence: true

    after_save :close_appointment
    def close_appointment
      self.appointment.update(open: false)
    end
  
end
