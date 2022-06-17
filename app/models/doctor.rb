
class Doctor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :appointments
  has_many :users, through: :appointments
  has_one_attached :avatar
  
  belongs_to :category, optional: true
  
  validates :phone_no, presence: true
  validates :phone_no, uniqueness: true
  validates :phone_no, format: { with: /^(\+\d{1,3}\s?)?1?\-?\.?\s?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$/, multiline: true }

  def available?
    self.appointments.count < 10
  end
  
end
