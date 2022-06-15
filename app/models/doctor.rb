class PhoneNoValidator < ActiveModel::Validator
  def validate(doctor)
    phone_no = doctor.phone_no
    if phone_no[0] != '+'
      doctor.errors.add :doctor, "phone_no should start with '+'"
    end
  end
end


class Doctor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :appointments
  has_many :users, through: :appointments
  
  belongs_to :category
  
  validates :phone_no, presence: true
  validates :phone_no, uniqueness: true
  validates :phone_no, length: { is: 14 }
  validates_with PhoneNoValidator

end
