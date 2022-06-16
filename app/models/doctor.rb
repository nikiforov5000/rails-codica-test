
class Doctor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :appointments
  has_many :users, through: :appointments
  
  # belongs_to :category
  
  validates :phone_no, presence: true
  validates :phone_no, uniqueness: true
  validates :phone_no, format: { with: /^(\+\d{1,2}\s?)?1?\-?\.?\s?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$/, multiline: true }

end
