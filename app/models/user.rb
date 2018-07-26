class User < ApplicationRecord
  has_secure_password
  has_many :restaurants, dependent: :destroy
  has_many :menus, dependent: :destroy
end
