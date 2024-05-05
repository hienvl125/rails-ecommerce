class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { admin: 0, buyer: 1, seller: 2 }

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :role, inclusion: { in: roles.keys }
end
