class User < ApplicationRecord
  has_secure_password
  validates :email, :presence => true, :uniqueness => true

  has_many :restaurants, dependent: :destroy
  # has_many :menus, through: :restaurants
end
