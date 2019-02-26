class User < ApplicationRecord
  validates_presence_of :first_name, :last_name, :email, :password, :password_confirmation
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :mixes, dependent: :destroy
end
