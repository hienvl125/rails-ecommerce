class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { general: 0, admin: 1 }

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :role, inclusion: { in: roles.keys }

  def full_name
    "#{first_name} #{last_name}"
  end
end
