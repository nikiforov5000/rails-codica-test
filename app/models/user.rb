class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  attr_accessor :email_confirmation, :login
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :authentication_keys => [:phone_no]
        
  has_many :appointments
  has_many :doctors, through: :appointments
  
  validates :phone_no, uniqueness: true
  validates :phone_no, presence: true
end
